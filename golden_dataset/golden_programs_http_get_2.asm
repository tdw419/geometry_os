; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r8-r9  -- subroutine arguments/temp (caller-saved)
;   r6-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r4  = CMP result (DO NOT USE as general register!)

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
  LDI r3, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r8, 80
  LDI r1, PORT_CELL
  STORE r1, r8

  ; Initialize path to "/" followed by null
  LDI r1, PATH_BUF
  LDI r8, 47         ; '/'
  STORE r1, r8
  LDI r8, 0
  ADD r1, r3         ; r1 = PATH_BUF + 1
  STORE r1, r8      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r8, URL_BUF    ; src = URL start
  LDI r1, HOST_BUF   ; dst = host buffer
  LDI r13, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r2, r8       ; r2 = url[pos]

  ; Check null -- end of URL
  JZ r2, url_parse_done

  ; Check '/' -- start of path
  LDI r9, 47         ; '/'
  CMP r2, r9
  JZ r4, url_parse_path_start

  ; Check ':' -- start of port
  LDI r9, 58         ; ':'
  CMP r2, r9
  JZ r4, url_parse_port

  ; Copy char to host buffer
  STORE r1, r2
  ADD r8, r3          ; src++
  ADD r1, r3          ; dst++
  ADD r13, r3          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r8, r3

  ; Null-terminate host
  LDI r2, 0
  STORE r1, r2

  ; Parse port number
  LDI r1, 0          ; port = 0

url_parse_port_loop:
  LOAD r2, r8
  JZ r2, url_parse_port_done

  ; Check '/' -- start of path
  LDI r9, 47
  CMP r2, r9
  JNZ r4, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r9, PORT_CELL
  STORE r9, r1
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r9, 10
  MUL r1, r9        ; port *= 10
  LDI r9, 48         ; '0'
  SUB r2, r9        ; digit = char - '0'
  ADD r1, r2        ; port += digit

  ADD r8, r3
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r2, PORT_CELL
  STORE r2, r1
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r1 might be host dst ptr or port value -- use r13 (host_len) instead
  LDI r2, HOST_BUF
  ADD r2, r13         ; r2 = HOST_BUF + host_len
  LDI r9, 0
  STORE r2, r9       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r1, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r2, r8       ; char from URL
  JZ r2, url_parse_done
  STORE r1, r2      ; copy to path
  ADD r8, r3
  ADD r1, r3
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r4 = 0 on success
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
  LDI r13, FD_CELL    ; will store fd here

  ; CONNECT r8, r1, r13  -- but we need to use register numbers
  ; r8=addr, r1=port, r13=fd_out
  CONNECT r8, r1, r13

  ; Store fd to RAM
  LDI r2, FD_CELL
  STORE r2, r13

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r4 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r8, REQ_BUF    ; dst = request buffer
  LDI r3, 1           ; increment

  ; ── "GET " ──
  LDI r1, 71         ; 'G'
  STORE r8, r1
  ADD r8, r3
  LDI r1, 69         ; 'E'
  STORE r8, r1
  ADD r8, r3
  LDI r1, 84         ; 'T'
  STORE r8, r1
  ADD r8, r3
  LDI r1, 32         ; ' '
  STORE r8, r1
  ADD r8, r3

  ; ── Copy path ──
  LDI r1, PATH_BUF
http_send_path_loop:
  LOAD r13, r1       ; char from path
  JZ r13, http_send_path_done
  STORE r8, r13
  ADD r8, r3
  ADD r1, r3
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r1, 32
  STORE r8, r1
  ADD r8, r3
  ; 'H'
  LDI r1, 72
  STORE r8, r1
  ADD r8, r3
  ; 'T'
  LDI r1, 84
  STORE r8, r1
  ADD r8, r3
  ; 'T'
  LDI r1, 84
  STORE r8, r1
  ADD r8, r3
  ; 'P'
  LDI r1, 80
  STORE r8, r1
  ADD r8, r3
  ; '/'
  LDI r1, 47
  STORE r8, r1
  ADD r8, r3
  ; '1'
  LDI r1, 49
  STORE r8, r1
  ADD r8, r3
  ; '.'
  LDI r1, 46
  STORE r8, r1
  ADD r8, r3
  ; '0'
  LDI r1, 48
  STORE r8, r1
  ADD r8, r3
  ; '\r'
  LDI r1, 13
  STORE r8, r1
  ADD r8, r3
  ; '\n'
  LDI r1, 10
  STORE r8, r1
  ADD r8, r3
  ; 'H'
  LDI r1, 72
  STORE r8, r1
  ADD r8, r3
  ; 'o'
  LDI r1, 111
  STORE r8, r1
  ADD r8, r3
  ; 's'
  LDI r1, 115
  STORE r8, r1
  ADD r8, r3
  ; 't'
  LDI r1, 116
  STORE r8, r1
  ADD r8, r3
  ; ':'
  LDI r1, 58
  STORE r8, r1
  ADD r8, r3
  ; ' '
  LDI r1, 32
  STORE r8, r1
  ADD r8, r3

  ; ── Copy host ──
  LDI r1, HOST_BUF
http_send_host_loop:
  LOAD r13, r1
  JZ r13, http_send_host_done
  STORE r8, r13
  ADD r8, r3
  ADD r1, r3
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r1, 13         ; '\r'
  STORE r8, r1
  ADD r8, r3
  LDI r1, 10         ; '\n'
  STORE r8, r1
  ADD r8, r3
  LDI r1, 13         ; '\r'
  STORE r8, r1
  ADD r8, r3
  LDI r1, 10         ; '\n'
  STORE r8, r1
  ADD r8, r3

  ; Null-terminate request for safety
  LDI r1, 0
  STORE r8, r1

  ; ── Calculate request length ──
  LDI r1, REQ_BUF
  SUB r8, r1        ; r8 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r1, FD_CELL
  LOAD r1, r1       ; r1 = fd
  LDI r13, REQ_BUF    ; r13 = buf addr
  ; r8 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r1, r13, r8, r2

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
  LDI r3, 1           ; increment

  ; Store initial body_len = 0
  LDI r1, BODY_LEN
  STORE r1, r8

http_recv_loop:
  ; Check if buffer is full
  LDI r1, RESP_MAX
  CMP r8, r1
  BGE r4, http_recv_done

  ; Calculate remaining buffer space
  LDI r1, RESP_MAX
  SUB r1, r8        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r13, FD_CELL
  LOAD r13, r13       ; r13 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r2, RESP_BUF
  ADD r2, r8        ; r2 = buf addr

  ; r1 = remaining (max_len)
  SOCKRECV r13, r2, r1, r9

  ; Check result
  ; r4 = status: 0=OK, 6=would_block, 7=closed
  JZ r4, http_recv_got_data

  ; Connection closed -- done
  LDI r1, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r4, r1
  JZ r4, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r9 = bytes received
  ADD r8, r9        ; total += received

  ; Update body_len
  LDI r1, BODY_LEN
  STORE r1, r8

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r9, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r1, RESP_BUF
  ADD r1, r8
  LDI r13, 0
  STORE r1, r13

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
  LDI r3, 1
  LDI r1, 9
  ADD r8, r1        ; r8 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r13, r8       ; first digit
  LDI r1, 48
  SUB r13, r1        ; d1 = char - '0'
  LDI r1, 100
  MUL r13, r1        ; d1 * 100
  LDI r2, STATUS_CELL
  STORE r2, r13      ; partial status

  ADD r8, r3
  LOAD r13, r8       ; second digit
  LDI r1, 48
  SUB r13, r1        ; d2 = char - '0'
  LDI r1, 10
  MUL r13, r1        ; d2 * 10
  LDI r2, STATUS_CELL
  LOAD r2, r2
  ADD r2, r13
  LDI r13, STATUS_CELL
  STORE r13, r2      ; status += d2*10

  ADD r8, r3
  LOAD r13, r8       ; third digit
  LDI r1, 48
  SUB r13, r1        ; d3 = char - '0'
  LDI r2, STATUS_CELL
  LOAD r2, r2
  ADD r2, r13
  LDI r13, STATUS_CELL
  STORE r13, r2      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r8, RESP_BUF   ; scan position
  LDI r1, BODY_LEN
  LOAD r1, r1       ; response length
  LDI r13, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r13, r1
  BGE r4, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r2, r8       ; char[pos]
  LDI r9, 13         ; '\r'
  CMP r2, r9
  JNZ r4, http_strip_next

  ; Found \r, check \n\r\n
  MOV r6, r8
  ADD r6, r3
  LOAD r2, r6       ; char[pos+1]
  LDI r9, 10         ; '\n'
  CMP r2, r9
  JNZ r4, http_strip_next

  ADD r6, r3
  LOAD r2, r6       ; char[pos+2]
  LDI r9, 13         ; '\r'
  CMP r2, r9
  JNZ r4, http_strip_next

  ADD r6, r3
  LOAD r2, r6       ; char[pos+3]
  LDI r9, 10         ; '\n'
  CMP r2, r9
  JNZ r4, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r8, r3
  ADD r8, r3
  ADD r8, r3
  ADD r8, r3          ; r8 = body start

  ; Copy body to BODY_BUF
  LDI r2, BODY_BUF   ; dst
  LDI r6, 0          ; body count

http_strip_copy:
  LOAD r9, r8       ; char from body
  JZ r9, http_strip_copy_done
  STORE r2, r9      ; copy to body buffer
  ADD r8, r3
  ADD r2, r3
  ADD r6, r3
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r9, 0
  STORE r2, r9

  ; Update BODY_LEN to actual body length
  LDI r8, BODY_LEN
  STORE r8, r6

  POP r31
  RET

http_strip_next:
  ADD r8, r3
  ADD r13, r3
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
;         r4 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r4 should be NET_OK = 0)
  JNZ r4, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r4, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r4, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r4 already has error code
  POP r31
  RET
