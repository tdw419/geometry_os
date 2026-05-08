; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on a comparison between `r0` and `r14`. If the condition is met, it shifts bits in `r13`, performs an OR operation, and jumps to the end. If not, it sets up and draws lines using the `LINE` instruction, fills an area with a color using `FILL`, writes a pixel using `WPIXEL`, and then halts execution.

; conditional logic
; initialization
  LDI r4, 0xA9F195
  LDI r10, 0xB32A13
  LDI r5, 255
  LDI r9, 16
  LDI r29, 0xC6398A
  LDI r14, 553
  LDI r11, 2330
  LDI r0, 0x70E8EE
  CMP r0, r14
  JNZ r0, else_0
  SHL r13, r15, r10
  OR r14, r15, r3
  JMP endif_1
else_0:
  LDI r8, 3368
  LDI r13, 3697
  LDI r14, 139
  LDI r0, 0xCE84C4
  LDI r9, 10
  LINE r8, r13, r14, r0, r9
  LDI r9, 128
  LDI r8, 0
  LDI r12, 0xB3FD9A
  LDI r6, 2592
  LDI r13, 1302
  LINE r9, r8, r12, r6, r13
  LDI r15, 0x6CB101
  FILL r15
  LDI r11, 64
  LDI r1, 2648
  LDI r12, 0x65AE10
  WPIXEL
endif_1:
  HALT
