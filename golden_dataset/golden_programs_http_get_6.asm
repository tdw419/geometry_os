; DESCRIPTION: Geometry OS program to draw a colored object.

; http_get.asm -- HTTP Client Library for Geometry OS
;
; Provides subroutines for fetching web pages over HTTP/1.0.
; Uses the TCP networking opcodes (CONNECT, SOCKSEND, SOCKRECV, DISCONNECT).
;
; Memory layout:
;   0x6000..0x60FF  URL buffer (null-terminated string, e.g. "example.com:80/index.html")
;   0x6100..0x61FF  Host buffer (parsed from URL, null-terminated)
;   0x6200          Port number (u32, default 80)
;   0x6300..0x63FF  Path buffer (parsed from URL, null-terminated, e.g. "/index.html")
;   0x6400..0x67FF  HTTP request buffer (GET request string)
;   0x6800..0x8FFF  HTTP response buffer (up to 10K)
;   0x9000..0x97FF  Body buffer (response body after header strip)
;   0x9800          Connection fd (u32)
;   0x9804          Body length (u32)
;   0x9808          Response status code (u32, e.g. 200)
;
; Usage:
;   1. Write URL string to RAM starting at 0x6000
;   2. CALL url_parse        -- parses host/port/path from URL
;   3. CALL http_connect     -- TCP connect to host:port
;   4. CALL http_send_get    -- sends "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
;   5. CALL http_recv_response -- reads response into response buffer
;   6. CALL http_strip_headers -- separates body from headers
;
; Register conventions:
;   r8-r5  -- subroutine arguments/temp (caller-saved)
;   r3-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r6  = CMP result (DO NOT USE as general register!)

#define URL_BUF      0x6000
#define HOST_BUF     0x6100
#define PORT_CELL    0x6200
#define PATH_BUF     0x6300
#define REQ_BUF      0x6400
#define RESP_BUF     0x6800
#define BODY_BUF     0x9000
#define FD_CELL      0x9800
#define BODY_LEN     0x9804
#define STATUS_CELL  0x9808
#define RESP_MAX     10240

; ═══════════════════════════════════════════════
; url_parse -- Parse URL into host, port, path
;
; Input:  URL string at URL_BUF (0x6000)
; Output: HOST_BUF (0x6100), PORT_CELL (0x6200), PATH_BUF (0x6300)
;
; Supported formats:
;   "host/path"           -> host, port=80, "/path"
;   "host:port/path"      -> host, port, "/path"
;   "host"                -> host, port=80, "/"
;   "host:port"           -> host, port, "/"
; ═══════════════════════════════════════════════
url_parse:
  PUSH r31

  ; Set constants FIRST
  LDI r12, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r8, 80
  LDI r1, PORT_CELL
  STORE r1, r8

  ; Initialize path to "/" followed by null
  LDI r1, PATH_BUF
  LDI r8, 47         ; '/'
  STORE r1, r8
  LDI r8, 0
  ADD r1, r12         ; r1 = PATH_BUF + 1
  STORE r1, r8      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r8, URL_BUF    ; src = URL start
  LDI r1, HOST_BUF   ; dst = host buffer
  LDI r4, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r11, r8       ; r11 = url[pos]

  ; Check null -- end of URL
  JZ r11, url_parse_done

  ; Check '/' -- start of path
  LDI r5, 47         ; '/'
  CMP r11, r5
  JZ r6, url_parse_path_start

  ; Check ':' -- start of port
  LDI r5, 58         ; ':'
  CMP r11, r5
  JZ r6, url_parse_port

  ; Copy char to host buffer
  STORE r1, r11
  ADD r8, r12          ; src++
  ADD r1, r12          ; dst++
  ADD r4, r12          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r8, r12

  ; Null-terminate host
  LDI r11, 0
  STORE r1, r11

  ; Parse port number
  LDI r1, 0          ; port = 0

url_parse_port_loop:
  LOAD r11, r8
  JZ r11, url_parse_port_done

  ; Check '/' -- start of path
  LDI r5, 47
  CMP r11, r5
  JNZ r6, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r5, PORT_CELL
  STORE r5, r1
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r5, 10
  MUL r1, r5        ; port *= 10
  LDI r5, 48         ; '0'
  SUB r11, r5        ; digit = char - '0'
  ADD r1, r11        ; port += digit

  ADD r8, r12
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r11, PORT_CELL
  STORE r11, r1
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r1 might be host dst ptr or port value -- use r4 (host_len) instead
  LDI r11, HOST_BUF
  ADD r11, r4         ; r11 = HOST_BUF + host_len
  LDI r5, 0
  STORE r11, r5       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r1, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r11, r8       ; char from URL
  JZ r11, url_parse_done
  STORE r1, r11      ; copy to path
  ADD r8, r12
  ADD r1, r12
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r6 = 0 on success
; ═══════════════════════════════════════════════
http_connect:
  PUSH r31

  LDI r8, HOST_BUF   ; addr_reg = pointer to host string
  LDI r1, PORT_CELL
  LOAD r1, r1       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r4, FD_CELL    ; will store fd here

  ; CONNECT r8, r1, r4  -- but we need to use register numbers
  ; r8=addr, r1=port, r4=fd_out
  CONNECT r8, r1, r4

  ; Store fd to RAM
  LDI r11, FD_CELL
  STORE r11, r4

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r6 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r8, REQ_BUF    ; dst = request buffer
  LDI r12, 1           ; increment

  ; ── "GET " ──
  LDI r1, 71         ; 'G'
  STORE r8, r1
  ADD r8, r12
  LDI r1, 69         ; 'E'
  STORE r8, r1
  ADD r8, r12
  LDI r1, 84         ; 'T'
  STORE r8, r1
  ADD r8, r12
  LDI r1, 32         ; ' '
  STORE r8, r1
  ADD r8, r12

  ; ── Copy path ──
  LDI r1, PATH_BUF
http_send_path_loop:
  LOAD r4, r1       ; char from path
  JZ r4, http_send_path_done
  STORE r8, r4
  ADD r8, r12
  ADD r1, r12
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r1, 32
  STORE r8, r1
  ADD r8, r12
  ; 'H'
  LDI r1, 72
  STORE r8, r1
  ADD r8, r12
  ; 'T'
  LDI r1, 84
  STORE r8, r1
  ADD r8, r12
  ; 'T'
  LDI r1, 84
  STORE r8, r1
  ADD r8, r12
  ; 'P'
  LDI r1, 80
  STORE r8, r1
  ADD r8, r12
  ; '/'
  LDI r1, 47
  STORE r8, r1
  ADD r8, r12
  ; '1'
  LDI r1, 49
  STORE r8, r1
  ADD r8, r12
  ; '.'
  LDI r1, 46
  STORE r8, r1
  ADD r8, r12
  ; '0'
  LDI r1, 48
  STORE r8, r1
  ADD r8, r12
  ; '\r'
  LDI r1, 13
  STORE r8, r1
  ADD r8, r12
  ; '\n'
  LDI r1, 10
  STORE r8, r1
  ADD r8, r12
  ; 'H'
  LDI r1, 72
  STORE r8, r1
  ADD r8, r12
  ; 'o'
  LDI r1, 111
  STORE r8, r1
  ADD r8, r12
  ; 's'
  LDI r1, 115
  STORE r8, r1
  ADD r8, r12
  ; 't'
  LDI r1, 116
  STORE r8, r1
  ADD r8, r12
  ; ':'
  LDI r1, 58
  STORE r8, r1
  ADD r8, r12
  ; ' '
  LDI r1, 32
  STORE r8, r1
  ADD r8, r12

  ; ── Copy host ──
  LDI r1, HOST_BUF
http_send_host_loop:
  LOAD r4, r1
  JZ r4, http_send_host_done
  STORE r8, r4
  ADD r8, r12
  ADD r1, r12
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r1, 13         ; '\r'
  STORE r8, r1
  ADD r8, r12
  LDI r1, 10         ; '\n'
  STORE r8, r1
  ADD r8, r12
  LDI r1, 13         ; '\r'
  STORE r8, r1
  ADD r8, r12
  LDI r1, 10         ; '\n'
  STORE r8, r1
  ADD r8, r12

  ; Null-terminate request for safety
  LDI r1, 0
  STORE r8, r1

  ; ── Calculate request length ──
  LDI r1, REQ_BUF
  SUB r8, r1        ; r8 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r1, FD_CELL
  LOAD r1, r1       ; r1 = fd
  LDI r4, REQ_BUF    ; r4 = buf addr
  ; r8 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r1, r4, r8, r11

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_recv_response -- Read HTTP response into buffer
;
; Input:  FD_CELL
; Output: RESP_BUF filled, BODY_LEN = total bytes received
;
; Reads in chunks until connection closed or buffer full.
; Uses a loop with FRAME yields between reads.
; ═══════════════════════════════════════════════
http_recv_response:
  PUSH r31

  LDI r8, 0          ; total_received = 0
  LDI r12, 1           ; increment

  ; Store initial body_len = 0
  LDI r1, BODY_LEN
  STORE r1, r8

http_recv_loop:
  ; Check if buffer is full
  LDI r1, RESP_MAX
  CMP r8, r1
  BGE r6, http_recv_done

  ; Calculate remaining buffer space
  LDI r1, RESP_MAX
  SUB r1, r8        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r4, FD_CELL
  LOAD r4, r4       ; r4 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r11, RESP_BUF
  ADD r11, r8        ; r11 = buf addr

  ; r1 = remaining (max_len)
  SOCKRECV r4, r11, r1, r5

  ; Check result
  ; r6 = status: 0=OK, 6=would_block, 7=closed
  JZ r6, http_recv_got_data

  ; Connection closed -- done
  LDI r1, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r6, r1
  JZ r6, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r5 = bytes received
  ADD r8, r5        ; total += received

  ; Update body_len
  LDI r1, BODY_LEN
  STORE r1, r8

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r5, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r1, RESP_BUF
  ADD r1, r8
  LDI r4, 0
  STORE r1, r4

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_strip_headers -- Find body start after \r\n\r\n
;
; Input:  RESP_BUF, BODY_LEN
; Output: BODY_BUF filled with body content, BODY_LEN updated
;         STATUS_CELL = HTTP status code (200, 404, etc.)
;
; HTTP response format:
;   "HTTP/1.0 200 OK\r\nheaders...\r\n\r\nbody"
;   Status code is bytes 9-11 of first line (3 digits)
; ═══════════════════════════════════════════════
http_strip_headers:
  PUSH r31

  ; ── Parse status code from first line ──
  ; Status is at offset 9 (after "HTTP/1.0 ")
  LDI r8, RESP_BUF
  LDI r12, 1
  LDI r1, 9
  ADD r8, r1        ; r8 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r4, r8       ; first digit
  LDI r1, 48
  SUB r4, r1        ; d1 = char - '0'
  LDI r1, 100
  MUL r4, r1        ; d1 * 100
  LDI r11, STATUS_CELL
  STORE r11, r4      ; partial status

  ADD r8, r12
  LOAD r4, r8       ; second digit
  LDI r1, 48
  SUB r4, r1        ; d2 = char - '0'
  LDI r1, 10
  MUL r4, r1        ; d2 * 10
  LDI r11, STATUS_CELL
  LOAD r11, r11
  ADD r11, r4
  LDI r4, STATUS_CELL
  STORE r4, r11      ; status += d2*10

  ADD r8, r12
  LOAD r4, r8       ; third digit
  LDI r1, 48
  SUB r4, r1        ; d3 = char - '0'
  LDI r11, STATUS_CELL
  LOAD r11, r11
  ADD r11, r4
  LDI r4, STATUS_CELL
  STORE r4, r11      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r8, RESP_BUF   ; scan position
  LDI r1, BODY_LEN
  LOAD r1, r1       ; response length
  LDI r4, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r4, r1
  BGE r6, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r11, r8       ; char[pos]
  LDI r5, 13         ; '\r'
  CMP r11, r5
  JNZ r6, http_strip_next

  ; Found \r, check \n\r\n
  MOV r3, r8
  ADD r3, r12
  LOAD r11, r3       ; char[pos+1]
  LDI r5, 10         ; '\n'
  CMP r11, r5
  JNZ r6, http_strip_next

  ADD r3, r12
  LOAD r11, r3       ; char[pos+2]
  LDI r5, 13         ; '\r'
  CMP r11, r5
  JNZ r6, http_strip_next

  ADD r3, r12
  LOAD r11, r3       ; char[pos+3]
  LDI r5, 10         ; '\n'
  CMP r11, r5
  JNZ r6, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r8, r12
  ADD r8, r12
  ADD r8, r12
  ADD r8, r12          ; r8 = body start

  ; Copy body to BODY_BUF
  LDI r11, BODY_BUF   ; dst
  LDI r3, 0          ; body count

http_strip_copy:
  LOAD r5, r8       ; char from body
  JZ r5, http_strip_copy_done
  STORE r11, r5      ; copy to body buffer
  ADD r8, r12
  ADD r11, r12
  ADD r3, r12
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r5, 0
  STORE r11, r5

  ; Update BODY_LEN to actual body length
  LDI r8, BODY_LEN
  STORE r8, r3

  POP r31
  RET

http_strip_next:
  ADD r8, r12
  ADD r4, r12
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r8, BODY_BUF
  LDI r1, 0
  STORE r8, r1
  LDI r8, BODY_LEN
  STORE r8, r1

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r8, FD_CELL
  LOAD r8, r8
  DISCONNECT r8
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_get -- Full HTTP GET in one call
;
; Input:  URL string at URL_BUF (0x6000)
; Output: BODY_BUF (0x9000), BODY_LEN, STATUS_CELL
;         r6 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r6 should be NET_OK = 0)
  JNZ r6, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r6, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r6, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r6 already has error code
  POP r31
  RET
