; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a function `func_0` that performs bitwise operations and arithmetic, and then checks for a key input. If the key is '4', it enters a loop where it shifts bits and performs additional bitwise operations before halting.

; mixed program
; initialization
  LDI r1, 256
  LDI r9, 0xCC78B7
  LDI r12, 0x24507B
  LDI r6, 809
  LDI r15, 128
  LDI r13, 128
  CALL func_0
func_0:
  OR r12, r16, r1
  ADD r3, r11, r6
  SHR r13, r9, r3
  ADD r13, r3, r15
  RET
  IKEY r0
  CMPI r0, 4
  JNZ r0, key_1
  LDI r4, 0
loop_2:
  SHL r7, r0, r13
  ANDI r3, r14, 253
  AND r11, r10, r5
  AND r8, r14, r28
  LDI r6, 1
  SUB r4, r4, r6
  JNZ r4, loop_2
  CMP r1, r7
  HALT
