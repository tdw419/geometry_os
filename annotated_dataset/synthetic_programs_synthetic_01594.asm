; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs arithmetic operations such as addition and division. It includes conditional branching based on register comparisons and calls functions like `LINE` and `PSETI` for graphical operations, ultimately halting the program after checking a key input.

; mixed program
; initialization
  LDI r11, 3527
  LDI r5, 979
  LDI r6, 1005
  LDI r8, 0x189A96
  ADD r12, r1, r11
  CMP r7, r9
  JZ r7, else_0
  ADD r3, r8, r2
  JMP endif_1
else_0:
  LDI r11, 1460
  LDI r12, 0xCDE8F7
  LDI r14, 0x6046ED
  LDI r15, 2
  LDI r12, 255
  LINE r11, r12, r14, r15, r12
endif_1:
  DIV r12, r1, r7
  IKEY r4
  CMPI r4, 256
  JNZ r4, key_2
  LDI r6, 64
  LDI r2, 108
  LDI r12, 4
  PSETI
  HALT
