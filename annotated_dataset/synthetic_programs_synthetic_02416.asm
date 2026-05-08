; DESCRIPTION: This GeOS assembly code continuously draws a text frame and displays the string "HELLO" at a specific position on the screen. The loop initializes various registers to control drawing parameters and repeats indefinitely using a jump instruction.

; drawing loop program
; initialization
  LDI r2, 32
  LDI r5, 2644
  LDI r4, 10
main_0:
  LDI r1, 8
  LDI r6, 4
  LDI r12, 1606
  TEXT r1, r6, r12, "HELLO"
  ADDI r8, r3, 64
  FRAME
  JMP main_0
