; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws lines using the `LINE` instruction while decrementing a counter (`r3`). After exiting the loop, it calls two functions (`func_1` and `func_2`) that perform various arithmetic operations on registers. Finally, it performs some comparisons and bitwise operations before halting execution.

; mixed program
; initialization
  LDI r12, 2411
  LDI r0, 64
  LDI r9, 255
  LDI r7, 409
  LDI r5, 803
  LDI r3, 8
loop_0:
  LDI r9, 256
  LDI r23, 1830
  LDI r9, 4
  LDI r7, 2547
  LDI r5, 3756
  LINE r9, r23, r9, r7, r5
  ADDI r0, r7, 64
  LDI r0, 1
  SUB r3, r3, r0
  JNZ r3, loop_0
  CALL func_1
func_1:
  SUB r3, r8, r2
  MOD r13, r15, r9
  SHR r6, r12, r14
  XOR r12, r8, r5
  SHR r9, r5, r13
  RET
  CALL func_2
func_2:
  MOD r0, r4, r14
  SHL r0, r8, r14
  SHR r5, r3, r14
  XOR r0, r9, r1
  RET
  LDI r9, 259
  LDI r7, 1212
  LDI r10, 0xDFB0D9
  LDI r4, 1743
  LDI r30, 2624
  LINE r9, r7, r10, r4, r30
  CMP r6, r8
  XOR r11, r1, r7
  AND r0, r1, r27
  AND r3, r9, r2
  AND r11, r1, r13
  HALT
