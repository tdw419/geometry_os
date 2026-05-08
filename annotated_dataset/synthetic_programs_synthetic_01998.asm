; DESCRIPTION: The assembly code initializes several registers with specific values and performs a conditional comparison between `r10` and `r13`. If they are not equal, it loads new values into certain registers and executes a `LINE` instruction; otherwise, it shifts `r13` left by the value in `r4`. The program then halts.

; conditional logic
; initialization
  LDI r7, 337
  LDI r15, 4009
  LDI r27, 64
  LDI r13, 128
  LDI r6, 0xF259F2
  LDI r2, 16
  CMP r10, r13
  JNZ r10, else_0
  SHL r13, r0, r4
  JMP endif_1
else_0:
  LDI r14, 0xE716B6
  LDI r5, 1
  LDI r23, 2675
  LDI r2, 0x641B1F
  LDI r14, 64
  LINE r14, r5, r23, r2, r14
endif_1:
  HALT
