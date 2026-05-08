; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it calculates differences, draws rectangles, sets pixel colors, and updates frames. The loop continuously executes these operations, potentially creating a repeating visual pattern or animation on the screen.

; drawing loop program
; initialization
  LDI r12, 0x5F0F35
  LDI r1, 0xFCA1C1
  LDI r5, 0xCC7305
  LDI r0, 2
  LDI r3, 507
  LDI r6, 3385
main_0:
  SUB r13, r11, r14
  LDI r14, 0x2D28A6
  LDI r10, 128
  LDI r8, 10
  LDI r4, 10
  LDI r10, 0
  RECTF r14, r10, r8, r4, r10
  LDI r10, 255
  LDI r15, 0x1921E1
  LDI r2, 8
  PSETI
  FRAME
  JMP main_0
