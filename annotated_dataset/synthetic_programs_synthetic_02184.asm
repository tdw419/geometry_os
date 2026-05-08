; DESCRIPTION: The GeOS assembly code initializes registers with specific values and performs a counted animation involving pixel setting (`PSETI`), conditional comparisons (`CMPI`), bitwise operations (`ANDI`), and loops (`loop_0`, `loop_1`, `loop_2`). The animation likely involves drawing patterns or shapes on a display by manipulating pixel data.

; counted animation
; initialization
  LDI r26, 0xEA7FFB
  LDI r4, 3879
  LDI r0, 32
loop_0:
  LDI r3, 64
  LDI r30, 128
  LDI r2, 256
  PSETI
  LDI r9, 0
  LDI r0, 1
  LDI r24, 0xE81144
  PSET r9, r0, r24
  CMPI r4, r6, 241
  ANDI r6, r1, 127
  LDI r4, 1
  SUB r0, r0, r4
  JNZ r0, loop_0
  LDI r13, 0xBF79DF
loop_1:
  ADDI r5, r4, 0x0215E2
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_1
  LDI r9, 44
loop_2:
  CMPI r8, r14, 0xB581F9
  LDI r5, 3478
  FILL r5
  LDI r7, 1
  SUB r9, r9, r7
  JNZ r9, loop_2
  HALT
