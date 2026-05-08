; DESCRIPTION: Render a red rectangle at the screen.

; bitfield_demo.asm -- Demonstrates BFE and BFI opcodes
; Extracts RGB channels from a packed color and reassembles them swapped (BGR->RGB)
; BFE rd, src, width, lsb -- extract bits
; BFI rd, src, width, lsb -- insert bits

; Pack a color: R=0xAA, G=0xBB, B=0xCC into 0xAABBCC
LDI r10, 0xAA        ; R channel
LDI r14, 8           ; shift amount
SHL r10, r14          ; r10 = 0x0000AA00 (R at bits 8-15)
LDI r12, 0xBB        ; G channel
OR r10, r12           ; r10 = 0x0000AABB (R+G)
LDI r14, 16
SHL r10, r14          ; r10 = 0xAABB0000 (R+G shifted up)
LDI r12, 0xCC        ; B channel
OR r10, r12           ; r10 = 0xAABBCC (packed: R=bits16-23, G=bits8-15, B=bits0-7)

; Now extract each channel using BFE
; BFE r7, r10, r11, r1 -- extract 8 bits at lsb=16 from r10 -> R
LDI r11, 8           ; width = 8
LDI r1, 16          ; lsb = 16
BFE r7, r10, r11, r1  ; r7 = 0xAA (red channel)

; BFE r5, r10, r11, r0 -- extract 8 bits at lsb=8 from r10 -> G
LDI r0, 8           ; lsb = 8
BFE r5, r10, r11, r0  ; r5 = 0xBB (green channel)

; BFE r9, r10, r15, r3 -- extract 8 bits at lsb=0 from r10 -> B
LDI r15, 8          ; width = 8
LDI r3, 0          ; lsb = 0
BFE r9, r10, r15, r3 ; r9 = 0xCC (blue channel)

; Now reassemble as BGR: B at bits 16-23, G at bits 8-15, R at bits 0-7
LDI r4, 0          ; start with 0

; Insert B (r9) at bits 16-23
LDI r2, 8          ; width = 8
LDI r13, 16         ; lsb = 16
MOV r8, r9         ; src = blue
BFI r4, r8, r2, r13 ; r4 = 0x00CC0000

; Insert G (r5) at bits 8-15
LDI r13, 8          ; lsb = 8
MOV r8, r5         ; src = green
BFI r4, r8, r2, r13 ; r4 = 0x00CCBB00

; Insert R (r7) at bits 0-7
LDI r13, 0          ; lsb = 0
MOV r8, r7         ; src = red
BFI r4, r8, r2, r13 ; r4 = 0x00CCBBAA (BGR swapped!)

; Draw colored rectangles showing the transformation
; Original color (AABBCC) as a 32x32 rect at (10, 10)
LDI r20, 10
LDI r21, 10
LDI r22, 32
LDI r23, 32
RECTF r20, r21, r22, r23, r10  ; original

; Swapped color (CCBBAA) as a 32x32 rect at (60, 10)
LDI r20, 60
LDI r21, 10
RECTF r20, r21, r22, r23, r4 ; swapped

; Also demonstrate: extract single bits from a byte
; Create a pattern byte 0b10101010 = 0xAA
LDI r16, 0xAA

; Extract bit 0 (should be 0)
LDI r11, 1
LDI r1, 0
BFE r17, r16, r11, r1  ; r17 = bit 0 of 0xAA = 0

; Extract bit 1 (should be 1)
LDI r1, 1
BFE r18, r16, r11, r1  ; r18 = bit 1 of 0xAA = 1

; Extract bit 7 (should be 1)
LDI r1, 7
BFE r19, r16, r11, r1  ; r19 = bit 7 of 0xAA = 1

; Draw individual bits as 8x8 pixels at bottom of screen
; Bit 7 (r19=1) -> white pixel at (10, 200)
LDI r20, 10
LDI r21, 200
PSETI 10, 200, 0xFFFFFF
; Bit 1 (r18=1) -> white pixel at (26, 200)
PSETI 26, 200, 0xFFFFFF
; Bit 0 (r17=0) -> dark pixel at (42, 200) -- skip, already black

; Draw a 4-pixel-wide stripe pattern using BFE/BFI in a loop
; For each x from 100 to 200, extract 2 bits from a counter to pick color
LDI r20, 0           ; x counter
LDI r21, 100         ; x start
LDI r22, 200         ; x end
LDI r23, 1           ; increment
LDI r24, 0           ; row y

stripe_loop:
  ; Extract bits 0-1 of counter to get color index (0-3)
  LDI r25, 2
  LDI r26, 0
  BFE r27, r20, r25, r26  ; r27 = counter & 0x3

  ; Color palette in RAM at 0x7000
  ; Skip -- use CMP/BLT chain for 4 colors instead
  CMP r27, r25
  BLT r6, stripe_red

  ; r27 >= 2
  LDI r28, 3
  CMP r27, r28
  BLT r6, stripe_green

  ; r27 >= 3
  LDI r28, 4
  CMP r27, r28
  BLT r6, stripe_blue

  ; r27 >= 4 (shouldn't happen with 2-bit mask, but safe)
  JMP stripe_black

stripe_red:
  LDI r16, 0x00FF0000
  JMP stripe_draw
stripe_green:
  LDI r16, 0x0000FF00
  JMP stripe_draw
stripe_blue:
  LDI r16, 0x000000FF
  JMP stripe_draw
stripe_black:
  LDI r16, 0x00000000

stripe_draw:
  ; Draw 4-pixel-wide column
  PSET r21, r24, r16
  ADD r21, r23
  PSET r21, r24, r16
  ADD r21, r23
  PSET r21, r24, r16
  ADD r21, r23
  PSET r21, r24, r16

  ADD r20, r23        ; counter++
  ADD r21, r23        ; advance x

  ; Loop: check if x >= 200
  CMP r21, r22
  BLT r6, stripe_loop

HALT
