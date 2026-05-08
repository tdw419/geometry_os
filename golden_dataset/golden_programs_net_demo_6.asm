; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
  LDI r6, 10
  LDI r0, 10
  LDI r7, title
  TEXT r6, r0, r7

  ; Draw "Connecting..." message
  LDI r6, 10
  LDI r0, 30
  LDI r7, msg_connecting
  TEXT r6, r0, r7

  ; Store IP address string at 0x7000
  LDI r6, IP_ADDR
  LDI r0, 49        ; '1'
  STORE r6, r0
  LDI r0, 50        ; '2'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7002 = '2'
  LDI r0, 55        ; '7'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7003 = '7'
  LDI r0, 46        ; '.'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7004 = '.'
  LDI r0, 48        ; '0'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7005 = '0'
  LDI r0, 46        ; '.'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7006 = '.'
  LDI r0, 48        ; '0'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7007 = '0'
  LDI r0, 46        ; '.'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7008 = '.'
  LDI r0, 49        ; '1'
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x7009 = '1'
  LDI r0, 0         ; null terminator
  LDI r7, IP_ADDR
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  ADD r7, r7, r6
  STORE r7, r0      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r6, IP_ADDR
  LDI r0, PORT
  CONNECT r6, r0, r7

  ; Check if connect succeeded (r5 == 0)
  CMP r5, r5
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r6, 10
  LDI r0, 40
  LDI r7, msg_connected
  TEXT r6, r0, r7

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r6, SEND_BUF
  LDI r0, 72        ; 'H'
  STORE r6, r0
  LDI r0, 101       ; 'e'
  ADD r6, r6, r7
  STORE r6, r0      ; 'e'
  LDI r0, 108       ; 'l'
  ADD r6, r6, r7
  STORE r6, r0      ; 'l'
  LDI r0, 108       ; 'l'
  ADD r6, r6, r7
  STORE r6, r0      ; 'l'
  LDI r0, 111       ; 'o'
  ADD r6, r6, r7
  STORE r6, r0      ; 'o'
  LDI r0, 32        ; ' '
  ADD r6, r6, r7
  STORE r6, r0      ; ' '
  LDI r0, 102       ; 'f'
  ADD r6, r6, r7
  STORE r6, r0      ; 'f'
  LDI r0, 114       ; 'r'
  ADD r6, r6, r7
  STORE r6, r0      ; 'r'
  LDI r0, 111       ; 'o'
  ADD r6, r6, r7
  STORE r6, r0      ; 'o'
  LDI r0, 109       ; 'm'
  ADD r6, r6, r7
  STORE r6, r0      ; 'm'
  LDI r0, 32        ; ' '
  ADD r6, r6, r7
  STORE r6, r0      ; ' '
  LDI r0, 71        ; 'G'
  ADD r6, r6, r7
  STORE r6, r0      ; 'G'
  LDI r0, 101       ; 'e'
  ADD r6, r6, r7
  STORE r6, r0      ; 'e'
  LDI r0, 111       ; 'o'
  ADD r6, r6, r7
  STORE r6, r0      ; 'o'
  LDI r0, 109       ; 'm'
  ADD r6, r6, r7
  STORE r6, r0      ; 'm'
  LDI r0, 101       ; 'e'
  ADD r6, r6, r7
  STORE r6, r0      ; 'e'
  LDI r0, 116       ; 't'
  ADD r6, r6, r7
  STORE r6, r0      ; 't'
  LDI r0, 114       ; 'r'
  ADD r6, r6, r7
  STORE r6, r0      ; 'r'
  LDI r0, 121       ; 'y'
  ADD r6, r6, r7
  STORE r6, r0      ; 'y'
  LDI r0, 32        ; ' '
  ADD r6, r6, r7
  STORE r6, r0      ; ' '
  LDI r0, 79        ; 'O'
  ADD r6, r6, r7
  STORE r6, r0      ; 'O'
  LDI r0, 83        ; 'S'
  ADD r6, r6, r7
  STORE r6, r0      ; 'S'
  LDI r0, 33        ; '!'
  ADD r6, r6, r7
  STORE r6, r0      ; '!'

  ; Draw "Sent:" message
  LDI r6, 10
  LDI r0, 50
  LDI r7, msg_sent
  TEXT r6, r0, r7

  ; Draw the sent message
  LDI r6, 50
  LDI r0, 50
  LDI r7, SEND_BUF
  TEXT r6, r0, r7

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r7 = fd from CONNECT
  LDI r6, SEND_BUF
  LDI r0, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r7, r6, r0, r2

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r10, 100
wait_loop:
  FRAME
  SUB r10, r10, r7
  CMP r10, r7
  JNZ wait_loop
  CMP r10, r7
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r6, RECV_BUF
  LDI r0, 200
  SOCKRECV r7, r6, r0, r2

  ; Draw "Received:" message
  LDI r6, 10
  LDI r0, 60
  LDI r7, msg_recv
  TEXT r6, r0, r7

  ; Draw the received message
  LDI r6, 60
  LDI r0, 60
  LDI r7, RECV_BUF
  TEXT r6, r0, r7

  ; Disconnect
  DISCONNECT r7

  ; Draw "Done!" message
  LDI r6, 10
  LDI r0, 80
  LDI r7, msg_done
  TEXT r6, r0, r7

  HALT

connect_fail:
  ; Draw error message
  LDI r6, 10
  LDI r0, 40
  LDI r7, msg_error
  TEXT r6, r0, r7
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r7)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
