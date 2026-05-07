; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then checks for a key press (specifically key 10) and calls `func_1` if the condition is met. Inside `func_1`, it performs various arithmetic operations, conditional logic, and draws a line and text on the screen before halting execution.

; mixed program
; initialization
  LDI r6, 2
  LDI r2, 2
  LDI r14, 1900
; palette
  LDI r1, 0x243E
  LDI r10, 1
  LDI r14, 0x000066
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x00FF00
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x0044FF
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x8800FF
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x0000CC
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x008888
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x000000
  STORE r1, r14
  ADD r1, r1, r10
  LDI r14, 0x00FF00
  STORE r1, r14
  ADD r1, r1, r10
  IKEY r3
  CMPI r3, 10
  JNZ r3, key_0
  CALL func_1
func_1:
  SUB r11, r2, r14
  SHL r12, r14, r9
  MOD r14, r12, r2
  RET
  PUSH r15
  OR r27, r25, r5
  ADD r9, r19, r10
  SUB r0, r14, r13
  AND r11, r12, r5
  POP r15
  CMP r5, r11
  JZ r5, else_2
  ADD r8, r14, r13
  MOD r10, r24, r3
  SHR r15, r12, r14
  JMP endif_3
else_2:
  LDI r4, 2404
  LDI r0, 16
  LDI r2, 255
  LDI r14, 2951
  LDI r14, 0x76C57D
  LINE r4, r0, r2, r14, r14
  LDI r2, 4
  FILL r2
endif_3:
  LDI r13, 0xBFB0D9
  LDI r7, 0xAA82F8
  LDI r15, 0x466EDB
  TEXT r13, r7, r15, "HELLO"
  CMPI r8, 159
  LDI r3, 255
  LDI r10, 240
  LDI r2, 0x3C36E9
  PSETI
  PUSH r8
  PUSH r4
  PUSH r15
  DIV r15, r4, r3
  SUB r14, r7, r1
  OR r4, r13, r8
  SUB r28, r15, r13
  POP r15
  POP r4
  POP r8
  HALT
