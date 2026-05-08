; DESCRIPTION: A colored object centered at the screen with fixed size.

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
  LDI r12, 10
  LDI r11, 10
  LDI r10, title
  TEXT r12, r11, r10

  ; Draw "Connecting..." message
  LDI r12, 10
  LDI r11, 30
  LDI r10, msg_connecting
  TEXT r12, r11, r10

  ; Store IP address string at 0x7000
  LDI r12, IP_ADDR
  LDI r11, 49        ; '1'
  STORE r12, r11
  LDI r11, 50        ; '2'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7002 = '2'
  LDI r11, 55        ; '7'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7003 = '7'
  LDI r11, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7004 = '.'
  LDI r11, 48        ; '0'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7005 = '0'
  LDI r11, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7006 = '.'
  LDI r11, 48        ; '0'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7007 = '0'
  LDI r11, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7008 = '.'
  LDI r11, 49        ; '1'
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x7009 = '1'
  LDI r11, 0         ; null terminator
  LDI r10, IP_ADDR
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  ADD r10, r10, r12
  STORE r10, r11      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r12, IP_ADDR
  LDI r11, PORT
  CONNECT r12, r11, r10

  ; Check if connect succeeded (r7 == 0)
  CMP r7, r7
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r12, 10
  LDI r11, 40
  LDI r10, msg_connected
  TEXT r12, r11, r10

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r12, SEND_BUF
  LDI r11, 72        ; 'H'
  STORE r12, r11
  LDI r11, 101       ; 'e'
  ADD r12, r12, r10
  STORE r12, r11      ; 'e'
  LDI r11, 108       ; 'l'
  ADD r12, r12, r10
  STORE r12, r11      ; 'l'
  LDI r11, 108       ; 'l'
  ADD r12, r12, r10
  STORE r12, r11      ; 'l'
  LDI r11, 111       ; 'o'
  ADD r12, r12, r10
  STORE r12, r11      ; 'o'
  LDI r11, 32        ; ' '
  ADD r12, r12, r10
  STORE r12, r11      ; ' '
  LDI r11, 102       ; 'f'
  ADD r12, r12, r10
  STORE r12, r11      ; 'f'
  LDI r11, 114       ; 'r'
  ADD r12, r12, r10
  STORE r12, r11      ; 'r'
  LDI r11, 111       ; 'o'
  ADD r12, r12, r10
  STORE r12, r11      ; 'o'
  LDI r11, 109       ; 'm'
  ADD r12, r12, r10
  STORE r12, r11      ; 'm'
  LDI r11, 32        ; ' '
  ADD r12, r12, r10
  STORE r12, r11      ; ' '
  LDI r11, 71        ; 'G'
  ADD r12, r12, r10
  STORE r12, r11      ; 'G'
  LDI r11, 101       ; 'e'
  ADD r12, r12, r10
  STORE r12, r11      ; 'e'
  LDI r11, 111       ; 'o'
  ADD r12, r12, r10
  STORE r12, r11      ; 'o'
  LDI r11, 109       ; 'm'
  ADD r12, r12, r10
  STORE r12, r11      ; 'm'
  LDI r11, 101       ; 'e'
  ADD r12, r12, r10
  STORE r12, r11      ; 'e'
  LDI r11, 116       ; 't'
  ADD r12, r12, r10
  STORE r12, r11      ; 't'
  LDI r11, 114       ; 'r'
  ADD r12, r12, r10
  STORE r12, r11      ; 'r'
  LDI r11, 121       ; 'y'
  ADD r12, r12, r10
  STORE r12, r11      ; 'y'
  LDI r11, 32        ; ' '
  ADD r12, r12, r10
  STORE r12, r11      ; ' '
  LDI r11, 79        ; 'O'
  ADD r12, r12, r10
  STORE r12, r11      ; 'O'
  LDI r11, 83        ; 'S'
  ADD r12, r12, r10
  STORE r12, r11      ; 'S'
  LDI r11, 33        ; '!'
  ADD r12, r12, r10
  STORE r12, r11      ; '!'

  ; Draw "Sent:" message
  LDI r12, 10
  LDI r11, 50
  LDI r10, msg_sent
  TEXT r12, r11, r10

  ; Draw the sent message
  LDI r12, 50
  LDI r11, 50
  LDI r10, SEND_BUF
  TEXT r12, r11, r10

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r10 = fd from CONNECT
  LDI r12, SEND_BUF
  LDI r11, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r10, r12, r11, r5

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r6, 100
wait_loop:
  FRAME
  SUB r6, r6, r10
  CMP r6, r10
  JNZ wait_loop
  CMP r6, r10
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r12, RECV_BUF
  LDI r11, 200
  SOCKRECV r10, r12, r11, r5

  ; Draw "Received:" message
  LDI r12, 10
  LDI r11, 60
  LDI r10, msg_recv
  TEXT r12, r11, r10

  ; Draw the received message
  LDI r12, 60
  LDI r11, 60
  LDI r10, RECV_BUF
  TEXT r12, r11, r10

  ; Disconnect
  DISCONNECT r10

  ; Draw "Done!" message
  LDI r12, 10
  LDI r11, 80
  LDI r10, msg_done
  TEXT r12, r11, r10

  HALT

connect_fail:
  ; Draw error message
  LDI r12, 10
  LDI r11, 40
  LDI r10, msg_error
  TEXT r12, r11, r10
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r10)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
