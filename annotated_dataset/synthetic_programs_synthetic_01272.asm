; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then calls a function (`func_0`) that performs arithmetic operations, including multiplication, AND, subtraction, shifts (SHR, SAR), and conditional jumps based on key inputs (IKEY). The program also includes logic for handling specific key presses to modify values in registers and potentially halt execution.

; mixed program
; initialization
  LDI r5, 2842
  LDI r7, 4
; palette
  LDI r28, 0x24A4
  LDI r2, 1
  LDI r30, 0x00FF44
  STORE r28, r30
  ADD r28, r28, r2
  LDI r30, 0xFFFF00
  STORE r28, r30
  ADD r28, r28, r2
  LDI r30, 0x00FFAA
  STORE r28, r30
  ADD r28, r28, r2
  LDI r30, 0xAAAAAA
  STORE r28, r30
  ADD r28, r28, r2
  LDI r30, 0xFF4400
  STORE r28, r30
  ADD r28, r28, r2
  LDI r7, 0x8455E5
  STORE r7, r8
  LOAD r6, r7
  LDI r7, 10
  STORE r7, r3
  LOAD r13, r7
  LDI r9, 3877
  STORE r9, r1
  LOAD r8, r9
  LDI r1, 0
  STORE r1, r5
  LOAD r9, r1
  LDI r15, 0xBE82E2
  STORE r15, r14
  LOAD r4, r15
  CALL func_0
func_0:
  MUL r3, r24, r14
  AND r10, r0, r9
  SUB r4, r1, r13
  SHR r17, r7, r6
  SHR r10, r7, r0
  RET
  IKEY r2
  CMPI r2, 9
  JNZ r2, key_1
  CMPI r19, 38
  LDI r6, 128
  STORE r6, r12
  LOAD r27, r6
  LDI r5, 0xC9841A
  STORE r5, r15
  LOAD r10, r5
  LDI r5, 0
  STORE r5, r15
  LOAD r2, r5
  LDI r0, 442
  STORE r0, r10
  LOAD r1, r0
  LDI r0, 0xE1A319
  STORE r0, r4
  LOAD r10, r0
  SHR r11, r12, r4
  SAR r13, r15, r14
  SHR r9, r13, r2
  IKEY r7
  CMPI r7, 64
  JNZ r7, key_2
  PUSH r10
  PUSH r8
  PUSH r10
  PUSH r9
  SUB r9, r13, r3
  MOD r14, r1, r6
  POP r9
  POP r10
  POP r8
  POP r10
  HALT
