; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls a function `func_0` that performs arithmetic operations including MOD, SUB, DIV, ADD, and XOR. After the function call, it enters a loop to decrement a counter until it reaches zero, draws the text "WORLD" on the screen at a specified position, and then executes several shift operations, stores, loads, and halts the program.

; mixed program
; initialization
  LDI r3, 0x130D77
  LDI r15, 0x7837B5
  LDI r4, 256
  LDI r13, 3398
  CALL func_0
func_0:
  MOD r11, r14, r27
  SUB r27, r11, r8
  DIV r30, r6, r0
  ADD r7, r22, r6
  XOR r7, r4, r0
  RET
  LDI r4, 11
loop_1:
  ADDI r11, r7, 8
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_1
  LDI r2, 893
  LDI r7, 255
  LDI r14, 32
  DRAWTEXT r2, r7, r14, "WORLD"
  SHL r14, r2, r4
  SHL r10, r9, r13
  SHL r3, r6, r7
  SHLI r14, r3, 8
  LDI r15, 0x2BB4E0
  STORE r15, r10
  LOAD r13, r15
  LDI r13, 2356
  STORE r13, r15
  LOAD r3, r13
  LDI r11, 0x8EA07E
  STORE r11, r8
  LOAD r9, r11
  LDI r4, 2
  STORE r4, r14
  LOAD r11, r4
  LDI r10, 695
  STORE r10, r13
  LOAD r14, r10
  LDI r6, 16
  STORE r6, r12
  LOAD r17, r6
  LDI r9, 2093
  STORE r9, r5
  LOAD r7, r9
  HALT
