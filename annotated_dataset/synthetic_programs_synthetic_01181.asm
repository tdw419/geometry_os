; DESCRIPTION: The provided GeOS assembly code initializes several registers with specific values and enters a loop where it performs arithmetic operations, bitwise logic, and function calls. The main loop (`loop_0`) repeatedly modifies register values and decrements `r8` until it reaches zero, at which point it calls `func_1`. The `func_1` routine includes shifts, divisions, and memory operations, including storing and loading data from specific addresses. After completing its tasks, `func_1` returns to the main loop or halts execution.

; mixed program
; initialization
  LDI r4, 3004
  LDI r9, 16
  LDI r10, 2
  LDI r6, 2
  LDI r12, 255
  LDI r11, 115
  LDI r13, 64
  LDI r15, 3015
  LDI r8, 128
loop_0:
  ADDI r7, r10, 1
  OR r10, r4, r9
  DIV r9, r4, r15
  ANDI r6, r2, 0x4F73BC
  LDI r7, 1
  SUB r8, r8, r7
  JNZ r8, loop_0
  CALL func_1
func_1:
  SHR r1, r2, r11
  DIV r11, r2, r27
  RET
  PUSH r3
  ADD r1, r14, r10
  SHL r12, r2, r7
  AND r4, r15, r2
  SUB r3, r2, r10
  POP r3
  LDI r13, 1873
  STORE r13, r0
  LOAD r2, r13
  LDI r0, 0x4583F3
  STORE r0, r3
  LOAD r6, r0
  LDI r14, 64
  STORE r14, r14
  LOAD r8, r14
  LDI r10, 16
  STORE r10, r9
  LOAD r0, r10
  LDI r6, 2831
  STORE r6, r6
  LOAD r10, r6
  LDI r0, 3976
  STORE r0, r10
  LOAD r3, r0
  LDI r12, 4
loop_2:
  ADDI r24, r11, 64
  LDI r30, 32
  LDI r11, 256
  LDI r13, 1
  WPIXEL
  LDI r4, 2913
  FILL r4
  MOD r9, r6, r12
  LDI r2, 1
  SUB r12, r12, r2
  JNZ r12, loop_2
  LDI r28, 2763
  LDI r11, 0xED676F
  LDI r8, 0x980706
  LDI r3, 2280
  LDI r7, 3469
  RECTF r28, r11, r8, r3, r7
  HALT
