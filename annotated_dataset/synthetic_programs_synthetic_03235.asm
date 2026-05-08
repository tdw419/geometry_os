; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on a comparison. If the condition is met (r13 equals r2), it calculates the modulus of r5 and r6 by r7, performs a bitwise AND operation between r1 and r14, and shifts r13 right by r2 bits. If the condition is not met, it initializes more registers with different values and draws two circles using the `CIRCLE` instruction before halting execution.

; conditional logic
; initialization
  LDI r22, 1186
  LDI r5, 3601
  LDI r7, 32
  LDI r15, 2468
  LDI r4, 507
  LDI r1, 255
  LDI r2, 2819
  LDI r13, 32
  CMP r13, r2
  JNZ r13, else_0
  MOD r5, r6, r7
  AND r9, r1, r14
  SHR r12, r13, r2
  JMP endif_1
else_0:
  LDI r3, 0xE42167
  LDI r13, 1
  LDI r3, 594
  LDI r14, 978
  CIRCLE r3, r13, r3, r14
  LDI r11, 2
  LDI r5, 2066
  LDI r5, 147
  LDI r14, 3768
  CIRCLE r11, r5, r5, r14
endif_1:
  HALT
