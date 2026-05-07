; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a drawing loop where it repeatedly sets pixels on the screen using the `PSETI` instruction and updates frame buffers with the `FRAME` instruction. The loop continues indefinitely, resetting certain registers at each iteration.

; drawing loop program
; initialization
  LDI r14, 263
  LDI r11, 3794
  LDI r17, 0xBCB203
  LDI r13, 3919
  LDI r4, 3214
  LDI r15, 255
  LDI r6, 1
main_0:
  CMPI r12, r5, 64
  LDI r5, 255
  LDI r12, 3303
  LDI r26, 1959
  PSETI
  FRAME
  JMP main_0
