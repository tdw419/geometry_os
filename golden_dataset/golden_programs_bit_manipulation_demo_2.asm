; DESCRIPTION: This GeOS assembly code demonstrates bit manipulation operations on an 8-bit flag register by visually setting, clearing, inverting, and testing individual bits. It draws the state of the register as colored blocks on screen, illustrating the effects of BSET, BCLR, BNOT, and BTST instructions through green, red, blue, and yellow highlighting.

; bit_manipulation_demo.asm -- Visual demo of BNOT, BSET, BCLR, BTST
;
; Draws an 8-bit flag register on screen. Each bit is a colored block.
; Top row (y=20): set all bits green, then clear odd bits red
; Bottom row (y=70): BNOT inverts register, BTST highlights bit 2
;
; Register conventions:
;   r10 = flag register value
;   r11 = bit position counter (0-7)
;   r3 = x position
;   r15 = y position
;   r13 = block width (20)
;   r8 = block height (20)
;   r17 = constant 1 (increment)

; --- Initialize constants ---
LDI r10, 0
LDI r13, 20
LDI r8, 20
LDI r17, 1

; === Phase 1: BSET all 8 bits, draw green blocks ===
LDI r11, 0
LDI r3, 20
LDI r15, 20

set_loop:
  MOV r18, r11
  BSET r10, r18
  LDI r16, 0x00CC44
  RECTF r3, r15, r13, r8, r16
  ADD r3, r13
  ADD r3, r13
  ADD r11, r17
  LDI r18, 8
  CMP r11, r18
  BLT r14, set_loop

; Store: all bits set = 0xFF = 255
LDI r18, 0x3000
STORE r18, r10

; === Phase 2: BCLR odd bits (1,3,5,7), draw red ===
LDI r11, 1
LDI r3, 60

clr_loop:
  MOV r18, r11
  BCLR r10, r18
  LDI r16, 0xCC2222
  RECTF r3, r15, r13, r8, r16
  ADD r3, r13
  ADD r3, r13
  ADD r3, r13
  ADD r3, r13
  ADD r11, r17
  ADD r11, r17
  LDI r18, 8
  CMP r11, r18
  BLT r14, clr_loop

; Store: bits 0,2,4,6 set = 0x55 = 85
LDI r18, 0x3001
STORE r18, r10

; === Phase 3: BNOT -- invert register, draw bottom row ===
LDI r15, 70
LDI r11, 0
LDI r3, 20

BNOT r10

inv_draw:
  MOV r18, r11
  BTST r10, r18
  JZ r14, inv_clear
  LDI r16, 0x2266CC
  RECTF r3, r15, r13, r8, r16
  JMP inv_next
inv_clear:
  LDI r16, 0x111111
  RECTF r3, r15, r13, r8, r16
inv_next:
  ADD r3, r13
  ADD r3, r13
  ADD r11, r17
  LDI r18, 8
  CMP r11, r18
  BLT r14, inv_draw

; Store: inverted 0x55 = 0xAA = 170
LDI r18, 0x3002
STORE r18, r10

; === Phase 4: BTST bit 2 highlight with yellow border ===
; Bit 2 block is at x = 20 + 2*40 = 100
LDI r3, 100
LDI r15, 70
LDI r16, 0xFFFF00
RECTF r3, r15, r13, r8, r16

; Inner fill: bit 2 of 0xAA is set (0xAA = 10101010), so blue
LDI r3, 102
LDI r15, 72
LDI r18, 16
LDI r16, 0x2266CC
RECTF r3, r15, r18, r18, r16

; Store BTST result: bit 2 of 0xAA = 1
LDI r18, 2
BTST r10, r18
LDI r18, 0x3003
STORE r18, r14

HALT
