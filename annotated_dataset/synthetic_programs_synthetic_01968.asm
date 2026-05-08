; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a main loop (`loop_0`) where it repeatedly sets pixels on the screen using the `PSET` instruction until a counter (`r7`) reaches zero. After exiting the loop, it performs bitwise operations and enters another loop (`loop_1`) to draw lines and set individual pixels (`WPIXEL`). The code includes conditional checks for key presses (`IKEY`, `CMPI`, `JNZ`) and can halt execution based on specific key input values.

; mixed program
; initialization
  LDI r8, 2
  LDI r4, 0x06AA5F
  LDI r15, 0x8C336B
  LDI r3, 259
  LDI r1, 128
  LDI r14, 2216
  LDI r7, 0xE688E1
loop_0:
  LDI r9, 0x898BC6
  LDI r10, 0xB305D4
  LDI r9, 0x10D76C
  PSET r9, r10, r9
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_0
  XOR r1, r15, r30
  LDI r0, 45
loop_1:
  ANDI r8, r1, 108
  LDI r13, 0x808536
  LDI r13, 295
  LDI r3, 374
  WPIXEL
  LDI r8, 4
  LDI r9, 32
  LDI r1, 0x3F381F
  LDI r2, 0x34DC7F
  LDI r2, 0xDFB958
  LINE r8, r9, r1, r2, r2
  SHR r10, r6, r1
  LDI r2, 1
  SUB r0, r0, r2
  JNZ r0, loop_1
  IKEY r5
  CMPI r5, 222
  JNZ r5, key_2
  HALT
