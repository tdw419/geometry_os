; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. The outer loop (`loop_0`) decrements a counter in register `r8` until it reaches zero, while the inner loop (`loop_1`) performs bitwise operations on registers and decrements another counter in register `r7` until it also reaches zero. The code uses operations like `FILL`, `ADDI`, `SUB`, `JNZ`, `OR`, `ANDI`, `SHL`, and `XOR`. It ultimately halts execution when all loops complete.

; counted animation
; initialization
  LDI r15, 739
  LDI r11, 3294
  LDI r13, 0xCE870D
  LDI r12, 2272
  LDI r8, 27
  LDI r14, 8
  LDI r8, 0x203A36
loop_0:
  LDI r1, 0xC250E2
  FILL r1
  ADDI r6, r3, 16
  ADDI r30, r5, 0x53C9DE
  LDI r13, 1
  SUB r8, r8, r13
  JNZ r8, loop_0
  LDI r7, 32
loop_1:
  OR r3, r4, r0
  ANDI r12, r22, 10
  SHL r2, r11, r9
  XOR r11, r9, r8
  LDI r0, 1
  SUB r7, r7, r0
  JNZ r7, loop_1
  HALT
