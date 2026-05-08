; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, and enters a loop where it fills the screen with pixels and performs bitwise operations. It includes conditional jumps based on key input and calls a subroutine (`func_3`) that executes more arithmetic and logical operations. The main program continuously loops through these operations, modifying registers and performing frame updates.

; mixed program
; initialization
  LDI r6, 1577
  LDI r22, 1631
  LDI r0, 256
  LDI r1, 0xD01757
  LDI r15, 0xC8A72F
  LDI r13, 747
; palette
  LDI r7, 0x22D0
  LDI r11, 1
  LDI r15, 0x0044FF
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0xFF0000
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0x00FFAA
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0xFF4400
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0xFFFF00
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0xDD0044
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0xFF0000
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0x0044FF
  STORE r7, r15
  ADD r7, r7, r11
  LDI r15, 0xFF0000
  STORE r7, r15
  ADD r7, r7, r11
  AND r13, r14, r5
  OR r9, r13, r2
  LDI r1, 10
loop_0:
  LDI r4, 0
  FILL r4
  LDI r4, 128
  LDI r2, 2375
  LDI r2, 0xE11CB2
  WPIXEL
  LDI r7, 0
  LDI r5, 2555
  LDI r2, 3881
  WPIXEL
  LDI r14, 0xC96185
  LDI r8, 0xD65AA1
  LDI r13, 2736
  PSETI
  LDI r13, 1
  SUB r1, r1, r13
  JNZ r1, loop_0
  LDI r10, 0x756526
  STORE r10, r3
  LOAD r5, r10
  LDI r3, 3534
  STORE r3, r4
  LOAD r2, r3
  LDI r1, 0x1C41E2
  STORE r1, r11
  LOAD r13, r1
  LDI r4, 128
  STORE r4, r5
  LOAD r12, r4
  LDI r13, 255
loop_1:
  ADD r5, r7, r12
  ADDI r3, r14, 13
  SHR r7, r4, r2
  LDI r12, 1
  SUB r13, r13, r12
  JNZ r13, loop_1
  DIV r8, r5, r15
  SHL r1, r10, r3
  SAR r9, r6, r14
  SHL r2, r6, r7
  SHR r0, r7, r4
  IKEY r4
  CMPI r4, 0x7DCA4A
  JNZ r4, key_2
  CALL func_3
func_3:
  SHL r0, r9, r1
  MUL r5, r4, r12
  SHL r10, r5, r6
  SHR r2, r7, r11
  AND r2, r9, r12
  SHR r2, r1, r0
  RET
main_4:
  OR r4, r3, r12
  XOR r11, r12, r9
  AND r5, r9, r10
  OR r8, r1, r5
  SHL r14, r4, r6
  SHLI r10, r13, 0x67DF3A
  SHL r5, r12, r1
  FRAME
  JMP main_4
