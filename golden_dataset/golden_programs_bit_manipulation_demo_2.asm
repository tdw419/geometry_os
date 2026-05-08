; DESCRIPTION: Draws a red object at the screen with fixed size.

; bit_manipulation_demo.asm -- Visual demo of BNOT, BSET, BCLR, BTST
;
; Draws an 8-bit flag register on screen. Each bit is a colored block.
; Top row (y=20): set all bits green, then clear odd bits red
; Bottom row (y=70): BNOT inverts register, BTST highlights bit 2
;
; Register conventions:
;   r15 = flag register value
;   r5 = bit position counter (0-7)
;   r13 = x position
;   r4 = y position
;   r14 = block width (20)
;   r11 = block height (20)
;   r17 = constant 1 (increment)

; --- Initialize constants ---
LDI r15, 0
LDI r14, 20
LDI r11, 20
LDI r17, 1

; === Phase 1: BSET all 8 bits, draw green blocks ===
LDI r5, 0
LDI r13, 20
LDI r4, 20

set_loop:
  MOV r18, r5
  BSET r15, r18
  LDI r16, 0x00CC44
  RECTF r13, r4, r14, r11, r16
  ADD r13, r14
  ADD r13, r14
  ADD r5, r17
  LDI r18, 8
  CMP r5, r18
  BLT r8, set_loop

; Store: all bits set = 0xFF = 255
LDI r18, 0x3000
STORE r18, r15

; === Phase 2: BCLR odd bits (1,3,5,7), draw red ===
LDI r5, 1
LDI r13, 60

clr_loop:
  MOV r18, r5
  BCLR r15, r18
  LDI r16, 0xCC2222
  RECTF r13, r4, r14, r11, r16
  ADD r13, r14
  ADD r13, r14
  ADD r13, r14
  ADD r13, r14
  ADD r5, r17
  ADD r5, r17
  LDI r18, 8
  CMP r5, r18
  BLT r8, clr_loop

; Store: bits 0,2,4,6 set = 0x55 = 85
LDI r18, 0x3001
STORE r18, r15

; === Phase 3: BNOT -- invert register, draw bottom row ===
LDI r4, 70
LDI r5, 0
LDI r13, 20

BNOT r15

inv_draw:
  MOV r18, r5
  BTST r15, r18
  JZ r8, inv_clear
  LDI r16, 0x2266CC
  RECTF r13, r4, r14, r11, r16
  JMP inv_next
inv_clear:
  LDI r16, 0x111111
  RECTF r13, r4, r14, r11, r16
inv_next:
  ADD r13, r14
  ADD r13, r14
  ADD r5, r17
  LDI r18, 8
  CMP r5, r18
  BLT r8, inv_draw

; Store: inverted 0x55 = 0xAA = 170
LDI r18, 0x3002
STORE r18, r15

; === Phase 4: BTST bit 2 highlight with yellow border ===
; Bit 2 block is at x = 20 + 2*40 = 100
LDI r13, 100
LDI r4, 70
LDI r16, 0xFFFF00
RECTF r13, r4, r14, r11, r16

; Inner fill: bit 2 of 0xAA is set (0xAA = 10101010), so blue
LDI r13, 102
LDI r4, 72
LDI r18, 16
LDI r16, 0x2266CC
RECTF r13, r4, r18, r18, r16

; Store BTST result: bit 2 of 0xAA = 1
LDI r18, 2
BTST r15, r18
LDI r18, 0x3003
STORE r18, r8

HALT
