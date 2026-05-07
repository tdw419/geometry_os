; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs a series of operations including logical XORs, arithmetic subtractions, conditional jumps based on key input, function calls, pixel drawing, and line drawing on a graphical interface. The code also includes a subroutine `func_1` that manipulates register values through addition, shift left operations, and conditional branching.

; mixed program
; initialization
  LDI r13, 3783
  LDI r12, 0x114428
  LDI r1, 0xF20EE6
  LDI r11, 0xC7F2EF
  LDI r14, 32
  LDI r12, 3513
  LDI r1, 8
  PSET r14, r12, r1
  PUSH r1
  PUSH r9
  PUSH r19
  PUSH r9
  XOR r13, r5, r6
  XOR r3, r7, r9
  SUB r10, r5, r15
  POP r9
  POP r19
  POP r9
  POP r1
  IKEY r6
  CMPI r6, 210
  JNZ r6, key_0
  LDI r1, 0x3574B9
  LDI r15, 64
  LDI r14, 1357
  WPIXEL
  CALL func_1
func_1:
  ADD r14, r20, r9
  ADD r1, r0, r5
  SHL r8, r12, r0
  RET
  LDI r0, 2976
  STORE r0, r8
  LOAD r3, r0
  LDI r5, 3361
  STORE r5, r22
  LOAD r14, r5
  CMP r0, r7
  JNZ r0, else_2
  ADD r5, r13, r0
  MOD r10, r6, r14
  JMP endif_3
else_2:
  LDI r15, 0xB063B4
  LDI r11, 0xF26466
  LDI r0, 0x8367D4
  PSETI
  LDI r4, 0
  LDI r1, 0x370E86
  LDI r4, 393
  LDI r13, 4033
  LDI r14, 0xDDD5B2
  LINE r4, r1, r4, r13, r14
  LDI r14, 0x080BA9
  LDI r13, 16
  LDI r14, 2137
  LDI r4, 978
  LDI r3, 0x282735
  LINE r14, r13, r14, r4, r3
endif_3:
  HALT
