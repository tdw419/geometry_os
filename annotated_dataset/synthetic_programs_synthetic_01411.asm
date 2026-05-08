; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters an infinite loop where it draws the text "HELLO" at a fixed position on the screen using the `TEXT` instruction. The loop continuously updates the frame and jumps back to the start, likely for continuous rendering or animation.

; drawing loop program
; initialization
  LDI r4, 0x430EF2
  LDI r6, 4
  LDI r15, 0xC4B6D5
  LDI r9, 3999
main_0:
  LDI r14, 0xCD2B18
  LDI r13, 1470
  LDI r3, 16
  TEXT r14, r13, r3, "HELLO"
  SUB r7, r6, r0
  FRAME
  JMP main_0
