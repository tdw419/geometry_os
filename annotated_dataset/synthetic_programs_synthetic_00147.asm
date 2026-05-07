; DESCRIPTION: This GeOS assembly code initializes registers with specific values, enters a loop that decrements a register until it reaches zero, calls functions `func_1` and `func_2`, performs various arithmetic and logical operations within these functions, waits for a key press, and draws a line if the key pressed is '7'.

; mixed program
; initialization
  LDI r2, 8
  LDI r13, 0x4A1615
  LDI r4, 0x49D7D1
loop_0:
  ADDI r5, r8, 256
  LDI r0, 1
  SUB r4, r4, r0
  JNZ r4, loop_0
  CALL func_1
func_1:
  MOD r14, r15, r12
  XOR r5, r11, r7
  MUL r2, r9, r0
  MUL r11, r1, r3
  RET
  CALL func_2
func_2:
  SHL r18, r13, r12
  MOD r13, r14, r1
  RET
  OR r9, r0, r7
  XOR r19, r15, r4
  AND r1, r6, r4
  AND r7, r8, r1
  XOR r7, r13, r0
main_3:
  IKEY r15
  CMPI r15, 7
  JNZ r15, key_4
  AND r6, r0, r12
  AND r12, r3, r0
  XOR r2, r3, r0
  LDI r18, 1247
  LDI r4, 32
  LDI r14, 3180
  LDI r10, 673
  LDI r13, 4
  LINE r18, r4, r14, r10, r13
  FRAME
  JMP main_3
