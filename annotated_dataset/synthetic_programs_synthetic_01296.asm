; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs arithmetic and logical operations including XOR, AND, SUB, MUL, DIV, and MOD, calls functions `func_0`, `func_1`, and `func_2` to execute further calculations, and finally halts execution. The code also includes a conditional branch based on a comparison (`CMPI`) and draws a circle using the `CIRCLE` instruction.

; mixed program
; initialization
  LDI r14, 4
  LDI r8, 1670
  LDI r6, 1
  LDI r10, 256
  LDI r9, 2402
  LDI r1, 2761
  LDI r12, 64
  PUSH r27
  PUSH r0
  PUSH r5
  PUSH r9
  XOR r3, r11, r7
  MOD r13, r1, r2
  AND r15, r8, r5
  POP r9
  POP r5
  POP r0
  POP r27
  CALL func_0
func_0:
  SUB r1, r15, r31
  XOR r12, r2, r1
  MUL r1, r13, r0
  DIV r12, r1, r11
  RET
  LDI r12, 0
  LDI r11, 0x8930DD
  LDI r11, 1555
  LDI r1, 0xC22C15
  CIRCLE r12, r11, r11, r1
  CMPI r11, 106
  CALL func_1
func_1:
  ADD r9, r3, r8
  MUL r10, r11, r6
  SUB r26, r13, r9
  RET
  CALL func_2
func_2:
  DIV r12, r9, r14
  MOD r12, r2, r6
  RET
  HALT
