; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it repeatedly draws lines using the `LINE` instruction and writes pixels with `WPIXEL`, followed by updating the frame with `FRAME`. The loop continues indefinitely due to the `JMP main_0` instruction.

; drawing loop program
; initialization
  LDI r3, 4
  LDI r13, 8
main_0:
  LDI r6, 0
  LDI r2, 2
  LDI r13, 0xC7AA7C
  LDI r10, 0x80898A
  LDI r14, 0
  LINE r6, r2, r13, r10, r14
  LDI r10, 64
  LDI r13, 1301
  LDI r13, 3084
  WPIXEL
  FRAME
  JMP main_0
