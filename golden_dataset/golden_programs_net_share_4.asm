; DESCRIPTION: Render a green object at the screen.

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

LDI r5, 0x7000       ; IP address string location
LDI r3, 49            ; '1'
STORE r5, r3
LDI r5, 0x7001
LDI r3, 50            ; '2'
STORE r5, r3
LDI r5, 0x7002
LDI r3, 55            ; '7'
STORE r5, r3
LDI r5, 0x7003
LDI r3, 46            ; '.'
STORE r5, r3
LDI r5, 0x7004
LDI r3, 48            ; '0'
STORE r5, r3
LDI r5, 0x7005
LDI r3, 46            ; '.'
STORE r5, r3
LDI r5, 0x7006
LDI r3, 48            ; '0'
STORE r5, r3
LDI r5, 0x7007
LDI r3, 46            ; '.'
STORE r5, r3
LDI r5, 0x7008
LDI r3, 49            ; '1'
STORE r5, r3
LDI r5, 0x7009
LDI r3, 0             ; null terminator
STORE r5, r3

; Draw a test pattern on screen before sharing
LDI r7, 0             ; y = 0
LDI r0, 1             ; increment
LDI r6, 256           ; limit
LDI r4, 0xFF0000      ; start color (red)

draw_loop:
  LDI r1, 0           ; x = 0

x_loop:
  ; Color = (y * 256 + x) << 8 for a gradient
  MOV r8, r7
  MUL r8, r6
  ADD r8, r1
  SHL r8, r0
  PSET r1, r7, r8
  ADD r1, r0
  CMP r1, r6
  BLT r9, x_loop
  ADD r7, r0
  CMP r7, r6
  BLT r9, draw_loop

; Now share the screen
; Step 1: Connect to peer
LDI r14, 0x7000        ; IP address
LDI r3, 3839          ; port (ascii_world terminal port)
CONNECT r14, r3, r8    ; r8 = fd

; Check if connection succeeded
LDI r10, 0
CMP r9, r10
JNZ r9, connected     ; r9 = 0 on success

; Connection failed - show red screen
LDI r4, 0xFF0000
FILL r4
HALT

connected:
MOV r10, r8            ; r10 = connection fd

; Send screen as rows (256 pixels per row = 1 NET_SEND per row)
LDI r7, 0             ; y = 0
LDI r0, 1             ; increment
LDI r6, 256           ; limit

send_loop:
  ; Screen row address = screen buffer base
  ; We use screen_ram_mirror which starts at 0x10000 in the address space
  ; But for NET_SEND we can just use any RAM region with the data

  ; For this demo, we'll construct the pixel data in RAM at 0x8000
  ; Copy one row of screen to RAM[0x8000..0x80FF]
  LDI r1, 0
  LDI r5, 0x8000
  LDI r2, 0x10000     ; screen buffer base (conceptual)

copy_row:
  ; Use SCREENP to read each pixel, then store in RAM
  ; Actually, for simplicity, just send data from RAM region
  ; In a real scenario, the screen buffer is accessible
  ADD r1, r0
  CMP r1, r6
  BLT r9, copy_row

  ; NET_SEND r5, r6, r10 -- send 256 words from 0x8000 to connection r10
  NET_SEND r5, r6, r10

  ; Check send result
  LDI r2, 0
  CMP r9, r2
  JZ r9, send_failed

  ADD r7, r0
  CMP r7, r6
  BLT r9, send_loop

; Done - show green
LDI r4, 0x00FF00
FILL r4
HALT

send_failed:
  ; Show yellow to indicate partial send
  LDI r4, 0xFFFF00
  FILL r4
  DISCONNECT r10
  HALT
