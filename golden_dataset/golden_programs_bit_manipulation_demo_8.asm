; DESCRIPTION: Render a red object at the screen.

; bit_manipulation_demo.asm -- Visual demo of BNOT, BSET, BCLR, BTST
;
; Draws an 8-bit flag register on screen. Each bit is a colored block.
; Top row (y=20): set all bits green, then clear odd bits red
; Bottom row (y=70): BNOT inverts register, BTST highlights bit 2
;
; Register conventions:
;   r12 = flag register value
;   r1 = bit position counter (0-7)
;   r10 = x position
;   r8 = y position
;   r9 = block width (20)
;   r7 = block height (20)
;   r17 = constant 1 (increment)

; --- Initialize constants ---
LDI r12, 0
LDI r9, 20
LDI r7, 20
LDI r17, 1

; === Phase 1: BSET all 8 bits, draw green blocks ===
LDI r1, 0
LDI r10, 20
LDI r8, 20

set_loop:
  MOV r18, r1
  BSET r12, r18
  LDI r16, 0x00CC44
  RECTF r10, r8, r9, r7, r16
  ADD r10, r9
  ADD r10, r9
  ADD r1, r17
  LDI r18, 8
  CMP r1, r18
  BLT r11, set_loop

; Store: all bits set = 0xFF = 255
LDI r18, 0x3000
STORE r18, r12

; === Phase 2: BCLR odd bits (1,3,5,7), draw red ===
LDI r1, 1
LDI r10, 60

clr_loop:
  MOV r18, r1
  BCLR r12, r18
  LDI r16, 0xCC2222
  RECTF r10, r8, r9, r7, r16
  ADD r10, r9
  ADD r10, r9
  ADD r10, r9
  ADD r10, r9
  ADD r1, r17
  ADD r1, r17
  LDI r18, 8
  CMP r1, r18
  BLT r11, clr_loop

; Store: bits 0,2,4,6 set = 0x55 = 85
LDI r18, 0x3001
STORE r18, r12

; === Phase 3: BNOT -- invert register, draw bottom row ===
LDI r8, 70
LDI r1, 0
LDI r10, 20

BNOT r12

inv_draw:
  MOV r18, r1
  BTST r12, r18
  JZ r11, inv_clear
  LDI r16, 0x2266CC
  RECTF r10, r8, r9, r7, r16
  JMP inv_next
inv_clear:
  LDI r16, 0x111111
  RECTF r10, r8, r9, r7, r16
inv_next:
  ADD r10, r9
  ADD r10, r9
  ADD r1, r17
  LDI r18, 8
  CMP r1, r18
  BLT r11, inv_draw

; Store: inverted 0x55 = 0xAA = 170
LDI r18, 0x3002
STORE r18, r12

; === Phase 4: BTST bit 2 highlight with yellow border ===
; Bit 2 block is at x = 20 + 2*40 = 100
LDI r10, 100
LDI r8, 70
LDI r16, 0xFFFF00
RECTF r10, r8, r9, r7, r16

; Inner fill: bit 2 of 0xAA is set (0xAA = 10101010), so blue
LDI r10, 102
LDI r8, 72
LDI r18, 16
LDI r16, 0x2266CC
RECTF r10, r8, r18, r18, r16

; Store BTST result: bit 2 of 0xAA = 1
LDI r18, 2
BTST r12, r18
LDI r18, 0x3003
STORE r18, r11

HALT
