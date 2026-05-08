; DESCRIPTION: This GeOS assembly code initializes a palette with various colors and then enters a loop where it performs bitwise operations and arithmetic calculations. It also includes function calls to manipulate registers and draw text and rectangles on the screen, using specific addresses and values for positioning and color.

; mixed program
; initialization
  LDI r6, 64
  LDI r4, 128
  LDI r15, 1
; palette
  LDI r6, 0x23DE
  LDI r10, 1
  LDI r7, 0xFFFFFF
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x00FF00
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x550077
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x00AAFF
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x0044FF
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0xDD0044
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x550077
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0xFFFFFF
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x008888
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0xFFAA00
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x00FF00
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0xFFEE00
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x44FF00
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x00FFAA
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0xFF8800
  STORE r6, r7
  ADD r6, r6, r10
  LDI r7, 0x44FF00
  STORE r6, r7
  ADD r6, r6, r10
  SAR r8, r30, r14
  SHL r9, r8, r5
  SHL r14, r2, r1
  SHL r8, r7, r4
  LDI r1, 0x7D7E55
  STORE r1, r6
  LOAD r12, r1
  LDI r9, 255
  STORE r9, r8
  LOAD r7, r9
  LDI r5, 3640
  STORE r5, r10
  LOAD r3, r5
  LDI r9, 0x9DB2AA
loop_0:
  CMPI r0, r3, 0xA26154
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_0
  CALL func_1
func_1:
  AND r4, r14, r7
  SHL r2, r8, r15
  SHR r3, r10, r4
  MOD r1, r6, r9
  RET
  SHL r11, r12, r7
main_2:
  XOR r1, r9, r4
  OR r2, r7, r12
  CMP r0, r1
  LDI r11, 256
  LDI r15, 0xAAEBE3
  LDI r0, 4
  DRAWTEXT r11, r15, r0, "WORLD"
  LDI r14, 619
  LDI r14, 3458
  LDI r12, 0x82D170
  TEXT r14, r14, r12, "HELLO"
  LDI r15, 1681
  LDI r3, 2794
  LDI r18, 10
  LDI r9, 0x2D1606
  LDI r5, 0x3A114E
  RECTF r15, r3, r18, r9, r5
  FRAME
  JMP main_2
