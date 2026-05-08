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
  LDI r2, 10
  LDI r5, 10
  LDI r14, title
  TEXT r2, r5, r14

  ; Draw "Connecting..." message
  LDI r2, 10
  LDI r5, 30
  LDI r14, msg_connecting
  TEXT r2, r5, r14

  ; Store IP address string at 0x7000
  LDI r2, IP_ADDR
  LDI r5, 49        ; '1'
  STORE r2, r5
  LDI r5, 50        ; '2'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7002 = '2'
  LDI r5, 55        ; '7'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7003 = '7'
  LDI r5, 46        ; '.'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7004 = '.'
  LDI r5, 48        ; '0'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7005 = '0'
  LDI r5, 46        ; '.'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7006 = '.'
  LDI r5, 48        ; '0'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7007 = '0'
  LDI r5, 46        ; '.'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7008 = '.'
  LDI r5, 49        ; '1'
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x7009 = '1'
  LDI r5, 0         ; null terminator
  LDI r14, IP_ADDR
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  ADD r14, r14, r2
  STORE r14, r5      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r2, IP_ADDR
  LDI r5, PORT
  CONNECT r2, r5, r14

  ; Check if connect succeeded (r3 == 0)
  CMP r3, r3
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r2, 10
  LDI r5, 40
  LDI r14, msg_connected
  TEXT r2, r5, r14

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r2, SEND_BUF
  LDI r5, 72        ; 'H'
  STORE r2, r5
  LDI r5, 101       ; 'e'
  ADD r2, r2, r14
  STORE r2, r5      ; 'e'
  LDI r5, 108       ; 'l'
  ADD r2, r2, r14
  STORE r2, r5      ; 'l'
  LDI r5, 108       ; 'l'
  ADD r2, r2, r14
  STORE r2, r5      ; 'l'
  LDI r5, 111       ; 'o'
  ADD r2, r2, r14
  STORE r2, r5      ; 'o'
  LDI r5, 32        ; ' '
  ADD r2, r2, r14
  STORE r2, r5      ; ' '
  LDI r5, 102       ; 'f'
  ADD r2, r2, r14
  STORE r2, r5      ; 'f'
  LDI r5, 114       ; 'r'
  ADD r2, r2, r14
  STORE r2, r5      ; 'r'
  LDI r5, 111       ; 'o'
  ADD r2, r2, r14
  STORE r2, r5      ; 'o'
  LDI r5, 109       ; 'm'
  ADD r2, r2, r14
  STORE r2, r5      ; 'm'
  LDI r5, 32        ; ' '
  ADD r2, r2, r14
  STORE r2, r5      ; ' '
  LDI r5, 71        ; 'G'
  ADD r2, r2, r14
  STORE r2, r5      ; 'G'
  LDI r5, 101       ; 'e'
  ADD r2, r2, r14
  STORE r2, r5      ; 'e'
  LDI r5, 111       ; 'o'
  ADD r2, r2, r14
  STORE r2, r5      ; 'o'
  LDI r5, 109       ; 'm'
  ADD r2, r2, r14
  STORE r2, r5      ; 'm'
  LDI r5, 101       ; 'e'
  ADD r2, r2, r14
  STORE r2, r5      ; 'e'
  LDI r5, 116       ; 't'
  ADD r2, r2, r14
  STORE r2, r5      ; 't'
  LDI r5, 114       ; 'r'
  ADD r2, r2, r14
  STORE r2, r5      ; 'r'
  LDI r5, 121       ; 'y'
  ADD r2, r2, r14
  STORE r2, r5      ; 'y'
  LDI r5, 32        ; ' '
  ADD r2, r2, r14
  STORE r2, r5      ; ' '
  LDI r5, 79        ; 'O'
  ADD r2, r2, r14
  STORE r2, r5      ; 'O'
  LDI r5, 83        ; 'S'
  ADD r2, r2, r14
  STORE r2, r5      ; 'S'
  LDI r5, 33        ; '!'
  ADD r2, r2, r14
  STORE r2, r5      ; '!'

  ; Draw "Sent:" message
  LDI r2, 10
  LDI r5, 50
  LDI r14, msg_sent
  TEXT r2, r5, r14

  ; Draw the sent message
  LDI r2, 50
  LDI r5, 50
  LDI r14, SEND_BUF
  TEXT r2, r5, r14

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r14 = fd from CONNECT
  LDI r2, SEND_BUF
  LDI r5, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r14, r2, r5, r12

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r6, 100
wait_loop:
  FRAME
  SUB r6, r6, r14
  CMP r6, r14
  JNZ wait_loop
  CMP r6, r14
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r2, RECV_BUF
  LDI r5, 200
  SOCKRECV r14, r2, r5, r12

  ; Draw "Received:" message
  LDI r2, 10
  LDI r5, 60
  LDI r14, msg_recv
  TEXT r2, r5, r14

  ; Draw the received message
  LDI r2, 60
  LDI r5, 60
  LDI r14, RECV_BUF
  TEXT r2, r5, r14

  ; Disconnect
  DISCONNECT r14

  ; Draw "Done!" message
  LDI r2, 10
  LDI r5, 80
  LDI r14, msg_done
  TEXT r2, r5, r14

  HALT

connect_fail:
  ; Draw error message
  LDI r2, 10
  LDI r5, 40
  LDI r14, msg_error
  TEXT r2, r5, r14
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r14)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
