; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it draws text and rectangles on the screen. The loop continuously displays "HELLO" and "WORLD" at different positions using various drawing commands, updating register values through bitwise operations and arithmetic, and then calls `FRAME` to render the updated display before repeating the process.

; drawing loop program
; initialization
  LDI r4, 255
  LDI r12, 0x32EFE4
  LDI r15, 0xFAFB3F
  LDI r5, 3337
  LDI r13, 128
main_0:
  LDI r31, 64
  LDI r14, 0xC13C0B
  LDI r11, 124
  TEXT r31, r14, r11, "HELLO"
  OR r10, r11, r5
  OR r25, r8, r11
  XOR r0, r12, r17
  XOR r4, r5, r13
  SHR r10, r26, r1
  SAR r12, r3, r2
  SHR r9, r24, r7
  SUB r26, r30, r8
  LDI r0, 0x56A466
  LDI r4, 0xB0659D
  LDI r4, 32
  LDI r2, 0
  LDI r7, 1850
  RECTF r0, r4, r4, r2, r7
  LDI r5, 1982
  LDI r11, 0x6913B2
  LDI r6, 0x6A9734
  DRAWTEXT r5, r11, r6, "WORLD"
  FRAME
  JMP main_0
