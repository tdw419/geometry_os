; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a drawing loop. In each iteration, it performs bitwise shifts, arithmetic operations, and draws the text "WORLD" at a calculated position on the screen, then checks a condition and updates the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r14, 0xA0EB5A
  LDI r8, 1
  LDI r1, 1353
  LDI r9, 0xF861CB
main_0:
  SAR r12, r5, r14
  SHR r18, r13, r5
  SHR r0, r3, r12
  SHL r30, r6, r9
  SUBI r0, r10, 215
  LDI r15, 0x3E8B4B
  LDI r1, 10
  LDI r6, 256
  DRAWTEXT r15, r1, r6, "WORLD"
  CMPI r11, r0, 79
  FRAME
  JMP main_0
