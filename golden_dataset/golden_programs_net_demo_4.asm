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
  LDI r1, 10
  LDI r15, 10
  LDI r13, title
  TEXT r1, r15, r13

  ; Draw "Connecting..." message
  LDI r1, 10
  LDI r15, 30
  LDI r13, msg_connecting
  TEXT r1, r15, r13

  ; Store IP address string at 0x7000
  LDI r1, IP_ADDR
  LDI r15, 49        ; '1'
  STORE r1, r15
  LDI r15, 50        ; '2'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7002 = '2'
  LDI r15, 55        ; '7'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7003 = '7'
  LDI r15, 46        ; '.'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7004 = '.'
  LDI r15, 48        ; '0'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7005 = '0'
  LDI r15, 46        ; '.'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7006 = '.'
  LDI r15, 48        ; '0'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7007 = '0'
  LDI r15, 46        ; '.'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7008 = '.'
  LDI r15, 49        ; '1'
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x7009 = '1'
  LDI r15, 0         ; null terminator
  LDI r13, IP_ADDR
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  ADD r13, r13, r1
  STORE r13, r15      ; 0x700A = null

  ; CONNECT addr_reg, port_reg, fd_reg
  LDI r1, IP_ADDR
  LDI r15, PORT
  CONNECT r1, r15, r13

  ; Check if connect succeeded (r2 == 0)
  CMP r2, r2
  JNZ connect_fail

  ; Draw "Connected!" message
  LDI r1, 10
  LDI r15, 40
  LDI r13, msg_connected
  TEXT r1, r15, r13

  ; Store "Hello from Geometry OS!" in send buffer
  LDI r1, SEND_BUF
  LDI r15, 72        ; 'H'
  STORE r1, r15
  LDI r15, 101       ; 'e'
  ADD r1, r1, r13
  STORE r1, r15      ; 'e'
  LDI r15, 108       ; 'l'
  ADD r1, r1, r13
  STORE r1, r15      ; 'l'
  LDI r15, 108       ; 'l'
  ADD r1, r1, r13
  STORE r1, r15      ; 'l'
  LDI r15, 111       ; 'o'
  ADD r1, r1, r13
  STORE r1, r15      ; 'o'
  LDI r15, 32        ; ' '
  ADD r1, r1, r13
  STORE r1, r15      ; ' '
  LDI r15, 102       ; 'f'
  ADD r1, r1, r13
  STORE r1, r15      ; 'f'
  LDI r15, 114       ; 'r'
  ADD r1, r1, r13
  STORE r1, r15      ; 'r'
  LDI r15, 111       ; 'o'
  ADD r1, r1, r13
  STORE r1, r15      ; 'o'
  LDI r15, 109       ; 'm'
  ADD r1, r1, r13
  STORE r1, r15      ; 'm'
  LDI r15, 32        ; ' '
  ADD r1, r1, r13
  STORE r1, r15      ; ' '
  LDI r15, 71        ; 'G'
  ADD r1, r1, r13
  STORE r1, r15      ; 'G'
  LDI r15, 101       ; 'e'
  ADD r1, r1, r13
  STORE r1, r15      ; 'e'
  LDI r15, 111       ; 'o'
  ADD r1, r1, r13
  STORE r1, r15      ; 'o'
  LDI r15, 109       ; 'm'
  ADD r1, r1, r13
  STORE r1, r15      ; 'm'
  LDI r15, 101       ; 'e'
  ADD r1, r1, r13
  STORE r1, r15      ; 'e'
  LDI r15, 116       ; 't'
  ADD r1, r1, r13
  STORE r1, r15      ; 't'
  LDI r15, 114       ; 'r'
  ADD r1, r1, r13
  STORE r1, r15      ; 'r'
  LDI r15, 121       ; 'y'
  ADD r1, r1, r13
  STORE r1, r15      ; 'y'
  LDI r15, 32        ; ' '
  ADD r1, r1, r13
  STORE r1, r15      ; ' '
  LDI r15, 79        ; 'O'
  ADD r1, r1, r13
  STORE r1, r15      ; 'O'
  LDI r15, 83        ; 'S'
  ADD r1, r1, r13
  STORE r1, r15      ; 'S'
  LDI r15, 33        ; '!'
  ADD r1, r1, r13
  STORE r1, r15      ; '!'

  ; Draw "Sent:" message
  LDI r1, 10
  LDI r15, 50
  LDI r13, msg_sent
  TEXT r1, r15, r13

  ; Draw the sent message
  LDI r1, 50
  LDI r15, 50
  LDI r13, SEND_BUF
  TEXT r1, r15, r13

  ; SOCKSEND fd_reg, buf_reg, len_reg, sent_reg
  ; r13 = fd from CONNECT
  LDI r1, SEND_BUF
  LDI r15, 23        ; length of "Hello from Geometry OS!"
  SOCKSEND r13, r1, r15, r3

  ; Wait a moment for echo (100 frames = ~1.6 seconds)
  LDI r6, 100
wait_loop:
  FRAME
  SUB r6, r6, r13
  CMP r6, r13
  JNZ wait_loop
  CMP r6, r13
  JZ wait_done
  JMP wait_loop

wait_done:
  ; SOCKRECV fd_reg, buf_reg, max_len_reg, recv_reg
  LDI r1, RECV_BUF
  LDI r15, 200
  SOCKRECV r13, r1, r15, r3

  ; Draw "Received:" message
  LDI r1, 10
  LDI r15, 60
  LDI r13, msg_recv
  TEXT r1, r15, r13

  ; Draw the received message
  LDI r1, 60
  LDI r15, 60
  LDI r13, RECV_BUF
  TEXT r1, r15, r13

  ; Disconnect
  DISCONNECT r13

  ; Draw "Done!" message
  LDI r1, 10
  LDI r15, 80
  LDI r13, msg_done
  TEXT r1, r15, r13

  HALT

connect_fail:
  ; Draw error message
  LDI r1, 10
  LDI r15, 40
  LDI r13, msg_error
  TEXT r1, r15, r13
  HALT

title:
  TEXTI "=== TCP Networking Demo ==="

msg_connecting:
  TEXTI "Connecting to 127.0.0.1:8888..."

msg_connected:
  TEXTI "Connected! (fd stored in r13)"

msg_sent:
  TEXTI "Sent:"

msg_recv:
  TEXTI "Echo:"

msg_done:
  TEXTI "Done! Connection closed."

msg_error:
  TEXTI "ERROR: Could not connect."
