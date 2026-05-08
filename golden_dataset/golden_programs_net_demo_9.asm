; DESCRIPTION: Render a colored object at the screen.

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
  LDI r3, 10
  LDI r10, title
  TEXT r14, r3, r10

  ; Draw "Connecting..." message
  LDI r14, 10
  LDI r3, 30
  LDI r10, msg_connecting
  TEXT r14, r3, r10

  ; Store IP address string at 0x7000
  LDI r14, IP_ADDR
  LDI r3, 49        ; '1'
  STORE r14, r3
  LDI r3, 50        ; '2'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7002 = '2'
  LDI r3, 55        ; '7'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7003 = '7'
  LDI r3, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7004 = '.'
  LDI r3, 48        ; '0'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7005 = '0'
  LDI r3, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7006 = '.'
  LDI r3, 48        ; '0'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7007 = '0'
  LDI r3, 46        ; '.'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7008 = '.'
  LDI r3, 49        ; '1'
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x7009 = '1'
  LDI r3, 0         ; null terminator
  LDI r10, IP_ADDR
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  ADD r10, r10, r14
  STORE r10, r3      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r14, IP_ADDR
  LDI r3, PORT
  CONNECT r14, r3, r10

  ; Check if connect succeeded (r0 == 0)
  CMP r0, r0
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r14, 10
  LDI r3, 40
  LDI r10, msg_connected
  TEXT r14, r3, r10

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r14, SEND_BUF
  LDI r3, 72        ; 'H'
  STORE r14, r3
  LDI r3, 101       ; 'e'
  ADD r14, r14, r10
  STORE r14, r3      ; 'e'
  LDI r3, 108       ; 'l'
  ADD r14, r14, r10
  STORE r14, r3      ; 'l'
  LDI r3, 108       ; 'l'
  ADD r14, r14, r10
  STORE r14, r3      ; 'l'
  LDI r3, 111       ; 'o'
  ADD r14, r14, r10
  STORE r14, r3      ; 'o'
  LDI r3, 32        ; ' '
  ADD r14, r14, r10
  STORE r14, r3      ; ' '
  LDI r3, 102       ; 'f'
  ADD r14, r14, r10
  STORE r14, r3      ; 'f'
  LDI r3, 114       ; 'r'
  ADD r14, r14, r10
  STORE r14, r3      ; 'r'
  LDI r3, 111       ; 'o'
  ADD r14, r14, r10
  STORE r14, r3      ; 'o'
  LDI r3, 109       ; 'm'
  ADD r14, r14, r10
  STORE r14, r3      ; 'm'
  LDI r3, 32        ; ' '
  ADD r14, r14, r10
  STORE r14, r3      ; ' '
  LDI r3, 71        ; 'G'
  ADD r14, r14, r10
  STORE r14, r3      ; 'G'
  LDI r3, 101       ; 'e'
  ADD r14, r14, r10
  STORE r14, r3      ; 'e'
  LDI r3, 111       ; 'o'
  ADD r14, r14, r10
  STORE r14, r3      ; 'o'
  LDI r3, 109       ; 'm'
  ADD r14, r14, r10
  STORE r14, r3      ; 'm'
  LDI r3, 101       ; 'e'
  ADD r14, r14, r10
  STORE r14, r3      ; 'e'
  LDI r3, 116       ; 't'
  ADD r14, r14, r10
  STORE r14, r3      ; 't'
  LDI r3, 114       ; 'r'
  ADD r14, r14, r10
  STORE r14, r3      ; 'r'
  LDI r3, 121       ; 'y'
  ADD r14, r14, r10
  STORE r14, r3      ; 'y'
  LDI r3, 32        ; ' '
  ADD r14, r14, r10
  STORE r14, r3      ; ' '
  LDI r3, 79        ; 'O'
  ADD r14, r14, r10
  STORE r14, r3      ; 'O'
  LDI r3, 83        ; 'S'
  ADD r14, r14, r10
  STORE r14, r3      ; 'S'
  LDI r3, 33        ; '!'
  ADD r14, r14, r10
  STORE r14, r3      ; '!'

  ; Draw "Sent:" message
  LDI r14, 10
  LDI r3, 50
  LDI r10, msg_sent
  TEXT r14, r3, r10

  ; Draw the sent message
  LDI r14, 50
  LDI r3, 50
  LDI r10, SEND_BUF
  TEXT r14, r3, r10

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r10 = fd from CONNECT
  LDI r14, SEND_BUF
  LDI r3, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r10, r14, r3, r4

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r13, 100
wait_loop:
  FRAME
  SUB r13, r13, r10
  CMP r13, r10
  JNZ wait_loop
  CMP r13, r10
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r14, RECV_BUF
  LDI r3, 200
  SOCKRECV r10, r14, r3, r4

  ; Draw "Received:" message
  LDI r14, 10
  LDI r3, 60
  LDI r10, msg_recv
  TEXT r14, r3, r10

  ; Draw the received message
  LDI r14, 60
  LDI r3, 60
  LDI r10, RECV_BUF
  TEXT r14, r3, r10

  ; Disconnect
  DISCONNECT r10

  ; Draw "Done!" message
  LDI r14, 10
  LDI r3, 80
  LDI r10, msg_done
  TEXT r14, r3, r10

  HALT

connect_fail:
  ; Draw error message
  LDI r14, 10
  LDI r3, 40
  LDI r10, msg_error
  TEXT r14, r3, r10
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
