; DESCRIPTION: This GeOS assembly code implements a TCP client that connects to an echo server on `127.0.0.1:8888`, sends the message "Hello from Geometry OS!", receives the echoed message, and displays it on the screen. If the connection fails, it displays an error message.

; net_demo.asm -- TCP Networking Demo for Geometry OS
; Connects to an echo server, sends a message, receives the echo, displays it.
;
; Usage: Start an echo server first:
;   python3 -c "import socket; s=socket.socket(); s.bind(('127.0.0.1', 8888)); s.listen(1); c,_=s.accept(); c.settimeout(5); [c.sendall(c.recv(4096)) for _ in iter(int,1)]"
;   Then run this program with F5.
;
; Memory layout:
;   0x7000..0x7010  server IP string ("127.0.0.1")
;   0x7100..0x71FF  send buffer
;   0x7200..0x72FF  receive buffer

#define IP_ADDR      0x7000
#define SEND_BUF     0x7100
#define RECV_BUF     0x7200
#define PORT         8888

  ; Draw title
  LDI r14, 10
  LDI r1, 10
  LDI r0, title
  TEXT r14, r1, r0

  ; Draw "Connecting..." message
  LDI r14, 10
  LDI r1, 30
  LDI r0, msg_connecting
  TEXT r14, r1, r0

  ; Store IP address string at 0x7000
  LDI r14, IP_ADDR
  LDI r1, 49        ; '1'
  STORE r14, r1
  LDI r1, 50        ; '2'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7002 = '2'
  LDI r1, 55        ; '7'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7003 = '7'
  LDI r1, 46        ; '.'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7004 = '.'
  LDI r1, 48        ; '0'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7005 = '0'
  LDI r1, 46        ; '.'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7006 = '.'
  LDI r1, 48        ; '0'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7007 = '0'
  LDI r1, 46        ; '.'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7008 = '.'
  LDI r1, 49        ; '1'
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x7009 = '1'
  LDI r1, 0         ; null terminator
  LDI r0, IP_ADDR
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  ADD r0, r0, r14
  STORE r0, r1      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r14, IP_ADDR
  LDI r1, PORT
  CONNECT r14, r1, r0

  ; Check if connect succeeded (r9 == 0)
  CMP r9, r9
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r14, 10
  LDI r1, 40
  LDI r0, msg_connected
  TEXT r14, r1, r0

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r14, SEND_BUF
  LDI r1, 72        ; 'H'
  STORE r14, r1
  LDI r1, 101       ; 'e'
  ADD r14, r14, r0
  STORE r14, r1      ; 'e'
  LDI r1, 108       ; 'l'
  ADD r14, r14, r0
  STORE r14, r1      ; 'l'
  LDI r1, 108       ; 'l'
  ADD r14, r14, r0
  STORE r14, r1      ; 'l'
  LDI r1, 111       ; 'o'
  ADD r14, r14, r0
  STORE r14, r1      ; 'o'
  LDI r1, 32        ; ' '
  ADD r14, r14, r0
  STORE r14, r1      ; ' '
  LDI r1, 102       ; 'f'
  ADD r14, r14, r0
  STORE r14, r1      ; 'f'
  LDI r1, 114       ; 'r'
  ADD r14, r14, r0
  STORE r14, r1      ; 'r'
  LDI r1, 111       ; 'o'
  ADD r14, r14, r0
  STORE r14, r1      ; 'o'
  LDI r1, 109       ; 'm'
  ADD r14, r14, r0
  STORE r14, r1      ; 'm'
  LDI r1, 32        ; ' '
  ADD r14, r14, r0
  STORE r14, r1      ; ' '
  LDI r1, 71        ; 'G'
  ADD r14, r14, r0
  STORE r14, r1      ; 'G'
  LDI r1, 101       ; 'e'
  ADD r14, r14, r0
  STORE r14, r1      ; 'e'
  LDI r1, 111       ; 'o'
  ADD r14, r14, r0
  STORE r14, r1      ; 'o'
  LDI r1, 109       ; 'm'
  ADD r14, r14, r0
  STORE r14, r1      ; 'm'
  LDI r1, 101       ; 'e'
  ADD r14, r14, r0
  STORE r14, r1      ; 'e'
  LDI r1, 116       ; 't'
  ADD r14, r14, r0
  STORE r14, r1      ; 't'
  LDI r1, 114       ; 'r'
  ADD r14, r14, r0
  STORE r14, r1      ; 'r'
  LDI r1, 121       ; 'y'
  ADD r14, r14, r0
  STORE r14, r1      ; 'y'
  LDI r1, 32        ; ' '
  ADD r14, r14, r0
  STORE r14, r1      ; ' '
  LDI r1, 79        ; 'O'
  ADD r14, r14, r0
  STORE r14, r1      ; 'O'
  LDI r1, 83        ; 'S'
  ADD r14, r14, r0
  STORE r14, r1      ; 'S'
  LDI r1, 33        ; '!'
  ADD r14, r14, r0
  STORE r14, r1      ; '!'

  ; Draw "Sent:" message
  LDI r14, 10
  LDI r1, 50
  LDI r0, msg_sent
  TEXT r14, r1, r0

  ; Draw the sent message
  LDI r14, 50
  LDI r1, 50
  LDI r0, SEND_BUF
  TEXT r14, r1, r0

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r0 = fd from CONNECT
  LDI r14, SEND_BUF
  LDI r1, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r0, r14, r1, r2

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r11, 100
wait_loop:
  FRAME
  SUB r11, r11, r0
  CMP r11, r0
  JNZ wait_loop
  CMP r11, r0
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r14, RECV_BUF
  LDI r1, 200
  SOCKRECV r0, r14, r1, r2

  ; Draw "Received:" message
  LDI r14, 10
  LDI r1, 60
  LDI r0, msg_recv
  TEXT r14, r1, r0

  ; Draw the received message
  LDI r14, 60
  LDI r1, 60
  LDI r0, RECV_BUF
  TEXT r14, r1, r0

  ; Disconnect
  DISCONNECT r0

  ; Draw "Done!" message
  LDI r14, 10
  LDI r1, 80
  LDI r0, msg_done
  TEXT r14, r1, r0

  HALT

connect_fail:
  ; Draw error message
  LDI r14, 10
  LDI r1, 40
  LDI r0, msg_error
  TEXT r14, r1, r0
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r0)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
