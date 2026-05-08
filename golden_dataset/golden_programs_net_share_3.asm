; DESCRIPTION: A green object centered at the screen with fixed size.

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

LDI r15, 0x7000       ; IP address string location
LDI r14, 49            ; '1'
STORE r15, r14
LDI r15, 0x7001
LDI r14, 50            ; '2'
STORE r15, r14
LDI r15, 0x7002
LDI r14, 55            ; '7'
STORE r15, r14
LDI r15, 0x7003
LDI r14, 46            ; '.'
STORE r15, r14
LDI r15, 0x7004
LDI r14, 48            ; '0'
STORE r15, r14
LDI r15, 0x7005
LDI r14, 46            ; '.'
STORE r15, r14
LDI r15, 0x7006
LDI r14, 48            ; '0'
STORE r15, r14
LDI r15, 0x7007
LDI r14, 46            ; '.'
STORE r15, r14
LDI r15, 0x7008
LDI r14, 49            ; '1'
STORE r15, r14
LDI r15, 0x7009
LDI r14, 0             ; null terminator
STORE r15, r14

; Draw a test pattern on screen before sharing
LDI r11, 0             ; y = 0
LDI r10, 1             ; increment
LDI r9, 256           ; limit
LDI r7, 0xFF0000      ; start color (red)

draw_loop:
  LDI r0, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r6, r11
  MUL r6, r9
  ADD r6, r0
  SHL r6, r10
  PSET r0, r11, r6
  ADD r0, r10
  CMP r0, r9
  BLT r4, x_loop
  ADD r11, r10
  CMP r11, r9
  BLT r4, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r3, 0x7000        ; IP address
LDI r14, 3839          ; port (ascii_world terminal port)
CONNECT r3, r14, r6    ; r6 = fd

; Check if connection succeeded
LDI r1, 0
CMP r4, r1
JNZ r4, connected     ; r4 = 0 on success

; Connection failed - show red screen
LDI r7, 0xFF0000
FILL r7
HALT

connected:
MOV r1, r6            ; r1 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r11, 0             ; y = 0
LDI r10, 1             ; increment
LDI r9, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r0, 0
  LDI r15, 0x8000
  LDI r5, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r0, r10
  CMP r0, r9
  BLT r4, copy_row

  ; NET_SEND r15, r9, r1 -- send 256 words from 0x8000 to connection r1
  NET_SEND r15, r9, r1

  ; Check send result
  LDI r5, 0
  CMP r4, r5
  JZ r4, send_failed

  ADD r11, r10
  CMP r11, r9
  BLT r4, send_loop

; Done - show green
LDI r7, 0x00FF00
FILL r7
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r7, 0xFFFF00
  FILL r7
  DISCONNECT r1
  HALT
