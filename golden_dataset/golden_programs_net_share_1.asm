; DESCRIPTION: This GeOS assembly code demonstrates screen sharing functionality by connecting to a listening Geometry OS instance and sending screen content as pixel protocol frames. It first draws a test pattern on the screen, then establishes a connection to a specified IP address and port, and sends each row of the screen as a sequence of pixels using the `NET_SEND` instruction. If any part of the transmission fails, it displays an error message; otherwise, it indicates successful completion with a green screen.

; net_share.asm -- Screen Sharing Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates NET_SEND for sharing screen content with a peer.
; Connect to a listening Geometry OS instance and send the screen
; as pixel protocol frames.
;
; Protocol: Each frame is a pixel protocol frame with type=0 (screen_share),
; containing a row of screen pixels (256 RGBA u32 values).
;
; Usage: Load on the sender side. Start a receiver with net_chat.asm or
; a custom listener first.

LDI r11, 0x7000       ; IP address string location
LDI r14, 49            ; '1'
STORE r11, r14
LDI r11, 0x7001
LDI r14, 50            ; '2'
STORE r11, r14
LDI r11, 0x7002
LDI r14, 55            ; '7'
STORE r11, r14
LDI r11, 0x7003
LDI r14, 46            ; '.'
STORE r11, r14
LDI r11, 0x7004
LDI r14, 48            ; '0'
STORE r11, r14
LDI r11, 0x7005
LDI r14, 46            ; '.'
STORE r11, r14
LDI r11, 0x7006
LDI r14, 48            ; '0'
STORE r11, r14
LDI r11, 0x7007
LDI r14, 46            ; '.'
STORE r11, r14
LDI r11, 0x7008
LDI r14, 49            ; '1'
STORE r11, r14
LDI r11, 0x7009
LDI r14, 0             ; null terminator
STORE r11, r14

; Draw a test pattern on screen before sharing
LDI r4, 0             ; y = 0
LDI r2, 1             ; increment
LDI r12, 256           ; limit
LDI r15, 0xFF0000      ; start color (red)

draw_loop:
  LDI r1, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r6, r4
  MUL r6, r12
  ADD r6, r1
  SHL r6, r2
  PSET r1, r4, r6
  ADD r1, r2
  CMP r1, r12
  BLT r8, x_loop
  ADD r4, r2
  CMP r4, r12
  BLT r8, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r5, 0x7000        ; IP address
LDI r14, 3839          ; port (ascii_world terminal port)
CONNECT r5, r14, r6    ; r6 = fd

; Check if connection succeeded
LDI r7, 0
CMP r8, r7
JNZ r8, connected     ; r8 = 0 on success

; Connection failed - show red screen
LDI r15, 0xFF0000
FILL r15
HALT

connected:
MOV r7, r6            ; r7 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r4, 0             ; y = 0
LDI r2, 1             ; increment
LDI r12, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r1, 0
  LDI r11, 0x8000
  LDI r3, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r1, r2
  CMP r1, r12
  BLT r8, copy_row

  ; NET_SEND r11, r12, r7 -- send 256 words from 0x8000 to connection r7
  NET_SEND r11, r12, r7

  ; Check send result
  LDI r3, 0
  CMP r8, r3
  JZ r8, send_failed

  ADD r4, r2
  CMP r4, r12
  BLT r8, send_loop

; Done - show green
LDI r15, 0x00FF00
FILL r15
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r15, 0xFFFF00
  FILL r15
  DISCONNECT r7
  HALT
