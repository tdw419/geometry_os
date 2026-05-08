; DESCRIPTION: Display a object using color colored at the screen.

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
;   r12-r0  -- subroutine arguments/temp (caller-saved)
;   r14-r19  -- subroutine local vars (caller-saved)
;   r20-r29  -- preserved across calls if needed (callee-saved by convention)
;   r30 = SP (grows down from 0xFF00)
;   r31 = LR (link register)
;   r9  = CMP result (DO NOT USE as general register!)

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
  LDI r10, 1           ; increment constant

  ; Initialize port to 80 (default)
  LDI r12, 80
  LDI r8, PORT_CELL
  STORE r8, r12

  ; Initialize path to "/" followed by null
  LDI r8, PATH_BUF
  LDI r12, 47         ; '/'
  STORE r8, r12
  LDI r12, 0
  ADD r8, r10         ; r8 = PATH_BUF + 1
  STORE r8, r12      ; path[1] = null

  ; ── Phase 1: Copy host part until ':' or '/' or null ──
  LDI r12, URL_BUF    ; src = URL start
  LDI r8, HOST_BUF   ; dst = host buffer
  LDI r1, 0          ; host_len = 0

url_parse_host_loop:
  ; Load char from URL
  LOAD r6, r12       ; r6 = url[pos]

  ; Check null -- end of URL
  JZ r6, url_parse_done

  ; Check '/' -- start of path
  LDI r0, 47         ; '/'
  CMP r6, r0
  JZ r9, url_parse_path_start

  ; Check ':' -- start of port
  LDI r0, 58         ; ':'
  CMP r6, r0
  JZ r9, url_parse_port

  ; Copy char to host buffer
  STORE r8, r6
  ADD r12, r10          ; src++
  ADD r8, r10          ; dst++
  ADD r1, r10          ; host_len++
  JMP url_parse_host_loop

url_parse_port:
  ; Skip the ':'
  ADD r12, r10

  ; Null-terminate host
  LDI r6, 0
  STORE r8, r6

  ; Parse port number
  LDI r8, 0          ; port = 0

url_parse_port_loop:
  LOAD r6, r12
  JZ r6, url_parse_port_done

  ; Check '/' -- start of path
  LDI r0, 47
  CMP r6, r0
  JNZ r9, url_parse_port_digit

  ; Found '/' after port -- save port first, then copy path
  LDI r0, PORT_CELL
  STORE r0, r8
  JMP url_parse_path_start

url_parse_port_digit:
  ; port = port * 10 + (char - '0')
  LDI r0, 10
  MUL r8, r0        ; port *= 10
  LDI r0, 48         ; '0'
  SUB r6, r0        ; digit = char - '0'
  ADD r8, r6        ; port += digit

  ADD r12, r10
  JMP url_parse_port_loop

url_parse_port_done:
  ; Store port
  LDI r6, PORT_CELL
  STORE r6, r8
  JMP url_parse_done

url_parse_path_start:
  ; Null-terminate host (safe even if already done)
  ; r8 might be host dst ptr or port value -- use r1 (host_len) instead
  LDI r6, HOST_BUF
  ADD r6, r1         ; r6 = HOST_BUF + host_len
  LDI r0, 0
  STORE r6, r0       ; null-terminate host

  ; Copy remaining URL to path buffer
  LDI r8, PATH_BUF   ; dst = path buffer

url_parse_path_loop:
  LOAD r6, r12       ; char from URL
  JZ r6, url_parse_done
  STORE r8, r6      ; copy to path
  ADD r12, r10
  ADD r8, r10
  JMP url_parse_path_loop

url_parse_done:
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_connect -- Connect to the parsed host:port
;
; Input:  HOST_BUF, PORT_CELL
; Output: FD_CELL = connection fd, r9 = 0 on success
; ═══════════════════════════════════════════════
http_connect:
  PUSH r31

  LDI r12, HOST_BUF   ; addr_reg = pointer to host string
  LDI r8, PORT_CELL
  LOAD r8, r8       ; port_reg = port number

  ; We need to load host address and port into registers
  ; CONNECT addr_reg, port_reg, fd_reg
  ; But CONNECT reads from RAM[addr_reg] as IP string
  ; We need a temp register for the fd output
  LDI r1, FD_CELL    ; will store fd here

  ; CONNECT r12, r8, r1  -- but we need to use register numbers
  ; r12=addr, r8=port, r1=fd_out
  CONNECT r12, r8, r1

  ; Store fd to RAM
  LDI r6, FD_CELL
  STORE r6, r1

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_send_get -- Build and send HTTP GET request
;
; Input:  HOST_BUF, PATH_BUF, FD_CELL
; Output: Request sent via TCP, r9 = 0 on success
;
; Builds: "GET /path HTTP/1.0\r\nHost: host\r\n\r\n"
; ═══════════════════════════════════════════════
http_send_get:
  PUSH r31

  ; Build request string in REQ_BUF (0x6400)
  LDI r12, REQ_BUF    ; dst = request buffer
  LDI r10, 1           ; increment

  ; ── "GET " ──
  LDI r8, 71         ; 'G'
  STORE r12, r8
  ADD r12, r10
  LDI r8, 69         ; 'E'
  STORE r12, r8
  ADD r12, r10
  LDI r8, 84         ; 'T'
  STORE r12, r8
  ADD r12, r10
  LDI r8, 32         ; ' '
  STORE r12, r8
  ADD r12, r10

  ; ── Copy path ──
  LDI r8, PATH_BUF
http_send_path_loop:
  LOAD r1, r8       ; char from path
  JZ r1, http_send_path_done
  STORE r12, r1
  ADD r12, r10
  ADD r8, r10
  JMP http_send_path_loop

http_send_path_done:
  ; ── " HTTP/1.0\r\nHost: " ──
  ; ' '
  LDI r8, 32
  STORE r12, r8
  ADD r12, r10
  ; 'H'
  LDI r8, 72
  STORE r12, r8
  ADD r12, r10
  ; 'T'
  LDI r8, 84
  STORE r12, r8
  ADD r12, r10
  ; 'T'
  LDI r8, 84
  STORE r12, r8
  ADD r12, r10
  ; 'P'
  LDI r8, 80
  STORE r12, r8
  ADD r12, r10
  ; '/'
  LDI r8, 47
  STORE r12, r8
  ADD r12, r10
  ; '1'
  LDI r8, 49
  STORE r12, r8
  ADD r12, r10
  ; '.'
  LDI r8, 46
  STORE r12, r8
  ADD r12, r10
  ; '0'
  LDI r8, 48
  STORE r12, r8
  ADD r12, r10
  ; '\r'
  LDI r8, 13
  STORE r12, r8
  ADD r12, r10
  ; '\n'
  LDI r8, 10
  STORE r12, r8
  ADD r12, r10
  ; 'H'
  LDI r8, 72
  STORE r12, r8
  ADD r12, r10
  ; 'o'
  LDI r8, 111
  STORE r12, r8
  ADD r12, r10
  ; 's'
  LDI r8, 115
  STORE r12, r8
  ADD r12, r10
  ; 't'
  LDI r8, 116
  STORE r12, r8
  ADD r12, r10
  ; ':'
  LDI r8, 58
  STORE r12, r8
  ADD r12, r10
  ; ' '
  LDI r8, 32
  STORE r12, r8
  ADD r12, r10

  ; ── Copy host ──
  LDI r8, HOST_BUF
http_send_host_loop:
  LOAD r1, r8
  JZ r1, http_send_host_done
  STORE r12, r1
  ADD r12, r10
  ADD r8, r10
  JMP http_send_host_loop

http_send_host_done:
  ; ── "\r\n\r\n" (end of headers) ──
  LDI r8, 13         ; '\r'
  STORE r12, r8
  ADD r12, r10
  LDI r8, 10         ; '\n'
  STORE r12, r8
  ADD r12, r10
  LDI r8, 13         ; '\r'
  STORE r12, r8
  ADD r12, r10
  LDI r8, 10         ; '\n'
  STORE r12, r8
  ADD r12, r10

  ; Null-terminate request for safety
  LDI r8, 0
  STORE r12, r8

  ; ── Calculate request length ──
  LDI r8, REQ_BUF
  SUB r12, r8        ; r12 = request length (dst - base)

  ; ── Send via TCP ──
  LDI r8, FD_CELL
  LOAD r8, r8       ; r8 = fd
  LDI r1, REQ_BUF    ; r1 = buf addr
  ; r12 = length
  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  SOCKSEND r8, r1, r12, r6

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

  LDI r12, 0          ; total_received = 0
  LDI r10, 1           ; increment

  ; Store initial body_len = 0
  LDI r8, BODY_LEN
  STORE r8, r12

http_recv_loop:
  ; Check if buffer is full
  LDI r8, RESP_MAX
  CMP r12, r8
  BGE r9, http_recv_done

  ; Calculate remaining buffer space
  LDI r8, RESP_MAX
  SUB r8, r12        ; remaining = RESP_MAX - total

  ; SOCKRECV fd, buf_addr, remaining, received
  LDI r1, FD_CELL
  LOAD r1, r1       ; r1 = fd

  ; Calculate write address: RESP_BUF + total_received
  LDI r6, RESP_BUF
  ADD r6, r12        ; r6 = buf addr

  ; r8 = remaining (max_len)
  SOCKRECV r1, r6, r8, r0

  ; Check result
  ; r9 = status: 0=OK, 6=would_block, 7=closed
  JZ r9, http_recv_got_data

  ; Connection closed -- done
  LDI r8, 7          ; NET_ERR_CONNECTION_CLOSED
  CMP r9, r8
  JZ r9, http_recv_done

  ; Would block -- yield a frame and retry
  FRAME
  JMP http_recv_loop

http_recv_got_data:
  ; r0 = bytes received
  ADD r12, r0        ; total += received

  ; Update body_len
  LDI r8, BODY_LEN
  STORE r8, r12

  ; Check if received 0 bytes (shouldn't happen, but safety)
  JZ r0, http_recv_done

  ; Continue reading
  JMP http_recv_loop

http_recv_done:
  ; Null-terminate response buffer at total_received position
  LDI r8, RESP_BUF
  ADD r8, r12
  LDI r1, 0
  STORE r8, r1

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
  LDI r12, RESP_BUF
  LDI r10, 1
  LDI r8, 9
  ADD r12, r8        ; r12 points to status code digits

  ; Parse 3-digit status: code = d1*100 + d2*10 + d3
  LOAD r1, r12       ; first digit
  LDI r8, 48
  SUB r1, r8        ; d1 = char - '0'
  LDI r8, 100
  MUL r1, r8        ; d1 * 100
  LDI r6, STATUS_CELL
  STORE r6, r1      ; partial status

  ADD r12, r10
  LOAD r1, r12       ; second digit
  LDI r8, 48
  SUB r1, r8        ; d2 = char - '0'
  LDI r8, 10
  MUL r1, r8        ; d2 * 10
  LDI r6, STATUS_CELL
  LOAD r6, r6
  ADD r6, r1
  LDI r1, STATUS_CELL
  STORE r1, r6      ; status += d2*10

  ADD r12, r10
  LOAD r1, r12       ; third digit
  LDI r8, 48
  SUB r1, r8        ; d3 = char - '0'
  LDI r6, STATUS_CELL
  LOAD r6, r6
  ADD r6, r1
  LDI r1, STATUS_CELL
  STORE r1, r6      ; status += d3

  ; ── Find \r\n\r\n delimiter ──
  LDI r12, RESP_BUF   ; scan position
  LDI r8, BODY_LEN
  LOAD r8, r8       ; response length
  LDI r1, 0          ; bytes scanned

http_strip_scan:
  ; Check if we've scanned enough (need at least 4 more bytes for \r\n\r\n)
  CMP r1, r8
  BGE r9, http_strip_no_body

  ; Check for \r\n\r\n pattern
  LOAD r6, r12       ; char[pos]
  LDI r0, 13         ; '\r'
  CMP r6, r0
  JNZ r9, http_strip_next

  ; Found \r, check \n\r\n
  MOV r14, r12
  ADD r14, r10
  LOAD r6, r14       ; char[pos+1]
  LDI r0, 10         ; '\n'
  CMP r6, r0
  JNZ r9, http_strip_next

  ADD r14, r10
  LOAD r6, r14       ; char[pos+2]
  LDI r0, 13         ; '\r'
  CMP r6, r0
  JNZ r9, http_strip_next

  ADD r14, r10
  LOAD r6, r14       ; char[pos+3]
  LDI r0, 10         ; '\n'
  CMP r6, r0
  JNZ r9, http_strip_next

  ; Found \r\n\r\n at pos! Body starts at pos+4
  ADD r12, r10
  ADD r12, r10
  ADD r12, r10
  ADD r12, r10          ; r12 = body start

  ; Copy body to BODY_BUF
  LDI r6, BODY_BUF   ; dst
  LDI r14, 0          ; body count

http_strip_copy:
  LOAD r0, r12       ; char from body
  JZ r0, http_strip_copy_done
  STORE r6, r0      ; copy to body buffer
  ADD r12, r10
  ADD r6, r10
  ADD r14, r10
  JMP http_strip_copy

http_strip_copy_done:
  ; Null-terminate body
  LDI r0, 0
  STORE r6, r0

  ; Update BODY_LEN to actual body length
  LDI r12, BODY_LEN
  STORE r12, r14

  POP r31
  RET

http_strip_next:
  ADD r12, r10
  ADD r1, r10
  JMP http_strip_scan

http_strip_no_body:
  ; No body found -- set body_len = 0, null-terminate body buf
  LDI r12, BODY_BUF
  LDI r8, 0
  STORE r12, r8
  LDI r12, BODY_LEN
  STORE r12, r8

  POP r31
  RET


; ═══════════════════════════════════════════════
; http_close -- Disconnect and clean up
; ═══════════════════════════════════════════════
http_close:
  PUSH r31
  LDI r12, FD_CELL
  LOAD r12, r12
  DISCONNECT r12
  POP r31
  RET


; ═══════════════════════════════════════════════
; http_get -- Full HTTP GET in one call
;
; Input:  URL string at URL_BUF (0x6000)
; Output: BODY_BUF (0x9000), BODY_LEN, STATUS_CELL
;         r9 = 0 on success
;
; This is the main entry point combining all steps.
; ═══════════════════════════════════════════════
http_get:
  PUSH r31

  ; Step 1: Parse URL
  CALL url_parse

  ; Step 2: Connect
  CALL http_connect

  ; Check connection result (r9 should be NET_OK = 0)
  JNZ r9, http_get_fail

  ; Step 3: Send GET request
  CALL http_send_get

  ; Check send result
  JNZ r9, http_get_close_fail

  ; Step 4: Receive response
  CALL http_recv_response

  ; Step 5: Strip headers, extract body
  CALL http_strip_headers

  ; Step 6: Close connection
  CALL http_close

  ; Success
  LDI r9, 0
  POP r31
  RET

http_get_close_fail:
  CALL http_close

http_get_fail:
  ; r9 already has error code
  POP r31
  RET
