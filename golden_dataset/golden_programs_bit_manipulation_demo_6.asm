; DESCRIPTION: This GeOS assembly code demonstrates bit manipulation operations on an 8-bit flag register by visually setting, clearing, inverting, and testing individual bits. It draws the state of the register as colored blocks on screen, illustrating the effects of BSET, BCLR, BNOT, and BTST instructions through green, red, blue, and yellow highlighting.

; bit_manipulation_demo.asm -- Visual demo of BNOT, BSET, BCLR, BTST
;
; Draws an 8-bit flag register on screen. Each bit is a colored block.
; Top row (y=20): set all bits green, then clear odd bits red
; Bottom row (y=70): BNOT inverts register, BTST highlights bit 2
;
; Register conventions:
;   r4 = flag register value
;   r11 = bit position counter (0-7)
;   r13 = x position
;   r6 = y position
;   r7 = block width (20)
;   r5 = block height (20)
;   r17 = constant 1 (increment)

; --- Initialize constants ---
LDI r4, 0
LDI r7, 20
LDI r5, 20
LDI r17, 1

; === Phase 1: BSET all 8 bits, draw green blocks ===
LDI r11, 0
LDI r13, 20
LDI r6, 20

set_loop:
  MOV r18, r11
  BSET r4, r18
  LDI r16, 0x00CC44
  RECTF r13, r6, r7, r5, r16
  ADD r13, r7
  ADD r13, r7
  ADD r11, r17
  LDI r18, 8
  CMP r11, r18
  BLT r3, set_loop

; Store: all bits set = 0xFF = 255
LDI r18, 0x3000
STORE r18, r4

; === Phase 2: BCLR odd bits (1,3,5,7), draw red ===
LDI r11, 1
LDI r13, 60

clr_loop:
  MOV r18, r11
  BCLR r4, r18
  LDI r16, 0xCC2222
  RECTF r13, r6, r7, r5, r16
  ADD r13, r7
  ADD r13, r7
  ADD r13, r7
  ADD r13, r7
  ADD r11, r17
  ADD r11, r17
  LDI r18, 8
  CMP r11, r18
  BLT r3, clr_loop

; Store: bits 0,2,4,6 set = 0x55 = 85
LDI r18, 0x3001
STORE r18, r4

; === Phase 3: BNOT -- invert register, draw bottom row ===
LDI r6, 70
LDI r11, 0
LDI r13, 20

BNOT r4

inv_draw:
  MOV r18, r11
  BTST r4, r18
  JZ r3, inv_clear
  LDI r16, 0x2266CC
  RECTF r13, r6, r7, r5, r16
  JMP inv_next
inv_clear:
  LDI r16, 0x111111
  RECTF r13, r6, r7, r5, r16
inv_next:
  ADD r13, r7
  ADD r13, r7
  ADD r11, r17
  LDI r18, 8
  CMP r11, r18
  BLT r3, inv_draw

; Store: inverted 0x55 = 0xAA = 170
LDI r18, 0x3002
STORE r18, r4

; === Phase 4: BTST bit 2 highlight with yellow border ===
; Bit 2 block is at x = 20 + 2*40 = 100
LDI r13, 100
LDI r6, 70
LDI r16, 0xFFFF00
RECTF r13, r6, r7, r5, r16

; Inner fill: bit 2 of 0xAA is set (0xAA = 10101010), so blue
LDI r13, 102
LDI r6, 72
LDI r18, 16
LDI r16, 0x2266CC
RECTF r13, r6, r18, r18, r16

; Store BTST result: bit 2 of 0xAA = 1
LDI r18, 2
BTST r4, r18
LDI r18, 0x3003
STORE r18, r3

HALT
