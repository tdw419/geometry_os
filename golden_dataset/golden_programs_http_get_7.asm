; DESCRIPTION: Render a colored object at the screen.

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
;   r7-r2  -- subroutine arguments/temp (caller-saved)
;   r15-r19  -- subroutine local vars (caller-saved)
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
  LDI r0, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r7, 80
  LDI r5, PORT_CELL
  STORE r5, r7

  ; Initialize path to "/" followed by null
  LDI r5, PATH_BUF
  LDI r7, 47         ; '/'
  STORE r5, r7
  LDI r7, 0
  ADD r5, r0         ; r5 = PATH_BUF + 1
  STORE r5, r7      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r7, URL_BUF    ; src = URL start
  LDI r5, HOST_BUF   ; dst = host buffer
  LDI r1, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r14, r7       ; r14 = url[pos]

  ; Check null -- end of URL
  JZ r14, url_parse_done

  ; Check '/' -- start of path
  LDI r2, 47         ; '/'
  CMP r14, r2
  JZ r4, url_parse_path_start

  ; Check ':' -- start of port
  LDI r2, 58         ; ':'
  CMP r14, r2
  JZ r4, url_parse_port

  ; Copy char to host buffer
  STORE r5, r14
  ADD r7, r0          ; src++
  ADD r5, r0          ; dst++
  ADD r1, r0          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r7, r0

  ; Null-terminate host
  LDI r14, 0
  STORE r5, r14

  ; Parse port number
  LDI r5, 0          ; port = 0

url_parse_port_loop:
  LOAD r14, r7
  JZ r14, url_parse_port_done

  ; Check '/' -- start of path
  LDI r2, 47
  CMP r14, r2
  JNZ r4, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r2, PORT_CELL
  STORE r2, r5
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r2, 10
  MUL r5, r2        ; port *= 10
  LDI r2, 48         ; '0'
  SUB r14, r2        ; digit = char - '0'
  ADD r5, r14        ; port += digit

  ADD r7, r0
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r14, PORT_CELL
  STORE r14, r5
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r5 might be host dst ptr or port value -- use r1 (host_len) instead
  LDI r14, HOST_BUF
  ADD r14, r1         ; r14 = HOST_BUF + host_len
  LDI r2, 0
  STORE r14, r2       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r5, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r14, r7       ; char from URL
  JZ r14, url_parse_done
  STORE r5, r14      ; copy to path
  ADD r7, r0
  ADD r5, r0
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

  LDI r7, HOST_BUF   ; addr_reg = pointer to host string
  LDI r5, PORT_CELL
  LOAD r5, r5       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r1, FD_CELL    ; will store fd here

  ; CONNECT r7, r5, r1  -- but we need to use register numbers
  ; r7=addr, r5=port, r1=fd_out
  CONNECT r7, r5, r1

  ; Store fd to RAM
  LDI r14, FD_CELL
  STORE r14, r1

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
  LDI r7, REQ_BUF    ; dst = request buffer
  LDI r0, 1           ; increment

  ; ── "GET " ──
  LDI r5, 71         ; 'G'
  STORE r7, r5
  ADD r7, r0
  LDI r5, 69         ; 'E'
  STORE r7, r5
  ADD r7, r0
  LDI r5, 84         ; 'T'
  STORE r7, r5
  ADD r7, r0
  LDI r5, 32         ; ' '
  STORE r7, r5
  ADD r7, r0

  ; ── Copy path ──
  LDI r5, PATH_BUF
http_send_path_loop:
  LOAD r1, r5       ; char from path
  JZ r1, http_send_path_done
  STORE r7, r1
  ADD r7, r0
  ADD r5, r0
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r5, 32
  STORE r7, r5
  ADD r7, r0
  ; 'H'
  LDI r5, 72
  STORE r7, r5
  ADD r7, r0
  ; 'T'
  LDI r5, 84
  STORE r7, r5
  ADD r7, r0
  ; 'T'
  LDI r5, 84
  STORE r7, r5
  ADD r7, r0
  ; 'P'
  LDI r5, 80
  STORE r7, r5
  ADD r7, r0
  ; '/'
  LDI r5, 47
  STORE r7, r5
  ADD r7, r0
  ; '1'
  LDI r5, 49
  STORE r7, r5
  ADD r7, r0
  ; '.'
  LDI r5, 46
  STORE r7, r5
  ADD r7, r0
  ; '0'
  LDI r5, 48
  STORE r7, r5
  ADD r7, r0
  ; '\r'
  LDI r5, 13
  STORE r7, r5
  ADD r7, r0
  ; '\n'
  LDI r5, 10
  STORE r7, r5
  ADD r7, r0
  ; 'H'
  LDI r5, 72
  STORE r7, r5
  ADD r7, r0
  ; 'o'
  LDI r5, 111
  STORE r7, r5
  ADD r7, r0
  ; 's'
  LDI r5, 115
  STORE r7, r5
  ADD r7, r0
  ; 't'
  LDI r5, 116
  STORE r7, r5
  ADD r7, r0
  ; ':'
  LDI r5, 58
  STORE r7, r5
  ADD r7, r0
  ; ' '
  LDI r5, 32
  STORE r7, r5
  ADD r7, r0

  ; ── Copy host ──
  LDI r5, HOST_BUF
http_send_host_loop:
  LOAD r1, r5
  JZ r1, http_send_host_done
  STORE r7, r1
  ADD r7, r0
  ADD r5, r0
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r5, 13         ; '\r'
  STORE r7, r5
  ADD r7, r0
  LDI r5, 10         ; '\n'
  STORE r7, r5
  ADD r7, r0
  LDI r5, 13         ; '\r'
  STORE r7, r5
  ADD r7, r0
  LDI r5, 10         ; '\n'
  STORE r7, r5
  ADD r7, r0

  ; Null-terminate request for safety
  LDI r5, 0
  STORE r7, r5

  ; ── Calculate request length ──
  LDI r5, REQ_BUF
  SUB r7, r5        ; r7 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r5, FD_CELL
  LOAD r5, r5       ; r5 = fd
  LDI r1, REQ_BUF    ; r1 = buf addr
  ; r7 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r5, r1, r7, r14

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

  LDI r7, 0          ; total_received = 0
  LDI r0, 1           ; increment

  ; Store initial body_len = 0
  LDI r5, BODY_LEN
  STORE r5, r7

http_recv_loop:
  ; Check if buffer is full
  LDI r5, RESP_MAX
  CMP r7, r5
  BGE r4, http_recv_done

  ; Calculate remaining buffer space
  LDI r5, RESP_MAX
  SUB r5, r7        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r1, FD_CELL
  LOAD r1, r1       ; r1 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r14, RESP_BUF
  ADD r14, r7        ; r14 = buf addr

  ; r5 = remaining (max_len)
  SOCKRECV r1, r14, r5, r2

  ; Check result
  ; r4 = status: 0=OK, 6=would_block, 7=closed
  JZ r4, http_recv_got_data

  ; Connection closed -- done
  LDI r5, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r4, r5
  JZ r4, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r2 = bytes received
  ADD r7, r2        ; total += received

  ; Update body_len
  LDI r5, BODY_LEN
  STORE r5, r7

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r2, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r5, RESP_BUF
  ADD r5, r7
  LDI r1, 0
  STORE r5, r1

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
  LDI r7, RESP_BUF
  LDI r0, 1
  LDI r5, 9
  ADD r7, r5        ; r7 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r1, r7       ; first digit
  LDI r5, 48
  SUB r1, r5        ; d1 = char - '0'
  LDI r5, 100
  MUL r1, r5        ; d1 * 100
  LDI r14, STATUS_CELL
  STORE r14, r1      ; partial status

  ADD r7, r0
  LOAD r1, r7       ; second digit
  LDI r5, 48
  SUB r1, r5        ; d2 = char - '0'
  LDI r5, 10
  MUL r1, r5        ; d2 * 10
  LDI r14, STATUS_CELL
  LOAD r14, r14
  ADD r14, r1
  LDI r1, STATUS_CELL
  STORE r1, r14      ; status += d2*10

  ADD r7, r0
  LOAD r1, r7       ; third digit
  LDI r5, 48
  SUB r1, r5        ; d3 = char - '0'
  LDI r14, STATUS_CELL
  LOAD r14, r14
  ADD r14, r1
  LDI r1, STATUS_CELL
  STORE r1, r14      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r7, RESP_BUF   ; scan position
  LDI r5, BODY_LEN
  LOAD r5, r5       ; response length
  LDI r1, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r1, r5
  BGE r4, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r14, r7       ; char[pos]
  LDI r2, 13         ; '\r'
  CMP r14, r2
  JNZ r4, http_strip_next

  ; Found \r, check \n\r\n
  MOV r15, r7
  ADD r15, r0
  LOAD r14, r15       ; char[pos+1]
  LDI r2, 10         ; '\n'
  CMP r14, r2
  JNZ r4, http_strip_next

  ADD r15, r0
  LOAD r14, r15       ; char[pos+2]
  LDI r2, 13         ; '\r'
  CMP r14, r2
  JNZ r4, http_strip_next

  ADD r15, r0
  LOAD r14, r15       ; char[pos+3]
  LDI r2, 10         ; '\n'
  CMP r14, r2
  JNZ r4, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r7, r0
  ADD r7, r0
  ADD r7, r0
  ADD r7, r0          ; r7 = body start

  ; Copy body to BODY_BUF
  LDI r14, BODY_BUF   ; dst
  LDI r15, 0          ; body count

http_strip_copy:
  LOAD r2, r7       ; char from body
  JZ r2, http_strip_copy_done
  STORE r14, r2      ; copy to body buffer
  ADD r7, r0
  ADD r14, r0
  ADD r15, r0
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r2, 0
  STORE r14, r2

  ; Update BODY_LEN to actual body length
  LDI r7, BODY_LEN
  STORE r7, r15

  POP r31
  RET

http_strip_next:
  ADD r7, r0
  ADD r1, r0
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r7, BODY_BUF
  LDI r5, 0
  STORE r7, r5
  LDI r7, BODY_LEN
  STORE r7, r5

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r7, FD_CELL
  LOAD r7, r7
  DISCONNECT r7
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
