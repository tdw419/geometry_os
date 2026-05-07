; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on a comparison between `r7` and `r25`. If they are equal, it executes an alternative path that includes setting pixels and filling areas with specified colors; otherwise, it performs bitwise operations and arithmetic before halting the program.

; conditional logic
; initialization
  LDI r8, 1380
  LDI r10, 1241
  LDI r11, 128
  LDI r12, 4
  LDI r1, 128
  LDI r7, 1561
  LDI r3, 0x56C022
  CMP r7, r25
  JZ r7, else_0
  OR r7, r6, r11
  SHL r0, r6, r4
  AND r8, r11, r14
  SUB r12, r7, r3
  JMP endif_1
else_0:
  LDI r7, 0x373B51
  FILL r7
  LDI r11, 4070
  LDI r8, 1165
  LDI r3, 0x66E45D
  PSET r11, r8, r3
  LDI r2, 0xBD10DC
  FILL r2
endif_1:
  HALT
