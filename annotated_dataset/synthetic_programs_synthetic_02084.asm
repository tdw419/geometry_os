; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then checks for key inputs. If certain keys are pressed, it performs arithmetic operations like multiplication and division, modifies memory locations, and writes pixels. The program halts after completing the specified operations based on the conditions met.

; mixed program
; initialization
  LDI r13, 4022
  LDI r5, 3821
  LDI r12, 458
  LDI r3, 534
  LDI r0, 3830
  LDI r1, 0xF83B36
  IKEY r12
  CMPI r12, 208
  JNZ r12, key_0
  IKEY r1
  CMPI r1, 256
  JNZ r1, key_1
  CMP r11, r3
  CMP r6, r0
  JZ r6, else_2
  MUL r29, r13, r5
  OR r7, r6, r5
  MUL r10, r12, r13
  DIV r11, r13, r2
  JMP endif_3
else_2:
  LDI r13, 0
  LDI r6, 32
  LDI r7, 0xAC7F2E
  WPIXEL
  LDI r10, 40
  FILL r10
endif_3:
  IKEY r6
  CMPI r6, 1
  JNZ r6, key_4
  CMP r8, r2
  IKEY r4
  CMPI r4, 0xF6A402
  JNZ r4, key_5
  LDI r3, 0x4C4C2D
  STORE r3, r10
  LOAD r7, r3
  LDI r1, 64
  STORE r1, r9
  LOAD r7, r1
  HALT
