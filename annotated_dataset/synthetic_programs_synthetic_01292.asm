; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it performs a series of bitwise operations on multiple registers. It then draws the text "WORLD" at a specific position using the `DRAWTEXT` instruction, shifts bits in certain registers, and updates the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r15, 16
  LDI r9, 4090
main_0:
  XOR r6, r2, r13
  XOR r13, r15, r6
  XOR r5, r30, r11
  AND r5, r15, r14
  XOR r9, r20, r3
  OR r15, r9, r12
  AND r15, r14, r9
  XOR r14, r2, r4
  OR r11, r2, r10
  LDI r8, 0
  LDI r5, 3748
  LDI r6, 2
  DRAWTEXT r8, r5, r6, "WORLD"
  SHR r2, r6, r11
  SAR r11, r18, r15
  FRAME
  JMP main_0
