; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it repeatedly draws the text "WORLD" at a specific position on the screen using the `DRAWTEXT` instruction. The loop is controlled by unconditional jumps (`JMP`) to the beginning, maintaining a constant frame update with `FRAME`.

; drawing loop program
; initialization
  LDI r7, 255
  LDI r2, 0x027E69
main_0:
  MUL r5, r13, r1
  MUL r0, r7, r14
  LDI r12, 112
  LDI r0, 648
  LDI r28, 1741
  DRAWTEXT r12, r0, r28, "WORLD"
  FRAME
  JMP main_0
