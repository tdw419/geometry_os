; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a function `func_0` that performs arithmetic operations like addition, multiplication, XOR, OR, and AND on these registers. The main loop in `main_1` compares two registers, shifts bits, frames the stack, and jumps back to itself, suggesting an infinite loop or a repeating computation based on register values.

; mixed program
; initialization
  LDI r12, 1859
  LDI r14, 0x8DDD7D
  LDI r3, 2646
  LDI r15, 0xEDD645
  CALL func_0
func_0:
  ADD r8, r2, r0
  XOR r5, r6, r10
  MUL r8, r6, r10
  OR r10, r0, r5
  XOR r11, r4, r5
  RET
  OR r1, r21, r13
  AND r11, r6, r8
  XOR r15, r7, r0
  XOR r1, r9, r3
  XOR r13, r15, r4
main_1:
  CMP r1, r15
  SUBI r7, r1, 0x70C080
  SHL r14, r12, r15
  SHR r14, r4, r7
  FRAME
  JMP main_1
