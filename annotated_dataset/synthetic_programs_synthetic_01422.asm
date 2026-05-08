; DESCRIPTION: This GeOS assembly code initializes registers, performs a loop that draws pixels and modifies register values, calls a function to perform bitwise operations and draw text, and finally halts the system. The loop subtracts a value from `r7` until it reaches zero, drawing pixels in a specific pattern each iteration. The function `func_1` shifts bits, performs logical operations, and draws the string "WORLD" at different coordinates using specified colors and fonts.

; mixed program
; initialization
  LDI r14, 10
  LDI r15, 8
  LDI r6, 0
  LDI r7, 44
loop_0:
  SUB r16, r13, r3
  LDI r9, 0x9F039C
  LDI r29, 0xDED2DD
  LDI r15, 2
  WPIXEL
  ADDI r6, r1, 78
  LDI r6, 1
  SUB r7, r7, r6
  JNZ r7, loop_0
  CALL func_1
func_1:
  SHL r10, r9, r14
  SHR r10, r1, r2
  RET
  AND r7, r14, r6
  AND r4, r9, r3
  LDI r14, 8
  LDI r15, 0x52E473
  LDI r8, 2212
  DRAWTEXT r14, r15, r8, "WORLD"
  LDI r7, 0x9B6A3F
  LDI r2, 1
  LDI r6, 934
  DRAWTEXT r7, r2, r6, "WORLD"
  LDI r1, 256
  LDI r5, 255
  LDI r19, 0x70A1DD
  PSETI
  PUSH r3
  PUSH r4
  PUSH r12
  SHL r13, r11, r1
  DIV r8, r4, r12
  DIV r1, r11, r3
  MUL r10, r2, r3
  POP r12
  POP r4
  POP r3
  OR r13, r8, r6
  HALT
