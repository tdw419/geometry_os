; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls two functions (`func_0` and `func_1`), performs bitwise operations like shifts, additions, subtractions, and logical AND, and includes text output and memory fill operations. The code also contains a loop in `main_2` that repeatedly executes a series of arithmetic and shift operations.

; mixed program
; initialization
  LDI r0, 2
  LDI r15, 0x3AF424
  LDI r6, 0xD47B37
  LDI r8, 0x860DD2
  LDI r10, 128
  LDI r1, 0x1377C2
  LDI r4, 0
  CALL func_0
func_0:
  SHL r23, r5, r6
  SHR r10, r3, r2
  RET
  LDI r6, 2211
  LDI r3, 1
  LDI r6, 3339
  TEXT r6, r3, r6, "HELLO"
  CALL func_1
func_1:
  SHL r1, r2, r12
  SUB r2, r10, r8
  SHL r0, r11, r15
  ADD r2, r5, r1
  AND r12, r3, r15
  RET
  SHR r9, r3, r11
  LDI r15, 4
  LDI r9, 1282
  LDI r2, 1342
  TEXT r15, r9, r2, "HELLO"
  LDI r7, 820
  FILL r7
main_2:
  SUB r4, r8, r7
  SHL r6, r8, r7
  SHR r14, r6, r30
  SAR r13, r26, r12
  FRAME
  JMP main_2
