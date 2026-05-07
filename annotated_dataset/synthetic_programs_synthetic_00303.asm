; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it draws a circle using the `CIRCLE` instruction. It then sets up another pixel using `WPIXEL`, shifts a register value right by 5 bits, compares it to 128, decrements a counter, and repeats until the counter reaches zero before halting execution.

; counted animation
; initialization
  LDI r7, 0xC5EE7F
  LDI r4, 1257
  LDI r8, 0x9EE42F
  LDI r13, 8
loop_0:
  LDI r12, 0x5204B7
  LDI r15, 3494
  LDI r0, 3977
  LDI r1, 1206
  CIRCLE r12, r15, r0, r1
  LDI r14, 0x56E64B
  LDI r15, 0xEEF4F2
  LDI r12, 0x01A0EE
  WPIXEL
  SHR r12, r5, r2
  CMPI r12, r2, 128
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_0
  HALT
