; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a drawing loop where it repeatedly draws circles using the `CIRCLE` instruction. The loop continues indefinitely, updating frame information and jumping back to the start after each iteration.

; drawing loop program
; initialization
  LDI r11, 137
  LDI r1, 32
  LDI r5, 64
  LDI r6, 0
  LDI r12, 128
  LDI r9, 1
  LDI r4, 0x094962
main_0:
  CMPI r11, r7, 128
  ADDI r14, r3, 0x5C9CE7
  LDI r5, 2906
  LDI r13, 16
  LDI r10, 2
  LDI r4, 969
  CIRCLE r5, r13, r10, r4
  SUB r9, r13, r7
  FRAME
  JMP main_0
