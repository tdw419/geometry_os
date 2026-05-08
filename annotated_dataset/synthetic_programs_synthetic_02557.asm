; DESCRIPTION: This GeOS assembly code initializes various registers and enters an infinite loop where it draws a line using the `LINE` instruction with specific parameters, then updates a register (`r9`) and calls the `FRAME` routine before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r13, 128
  LDI r12, 0x06BA01
  LDI r22, 64
  LDI r6, 255
  LDI r11, 276
main_0:
  LDI r1, 1983
  LDI r6, 0xD684A0
  LDI r6, 0x8CF4BE
  LDI r10, 40
  LDI r7, 1163
  LINE r1, r6, r6, r10, r7
  SUBI r9, r15, 164
  FRAME
  JMP main_0
