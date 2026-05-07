; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. In each iteration of the loop, it loads a color value into register `r6`, draws the text "HELLO" at coordinates determined by registers `r13` and `r1`, checks if certain conditions involving registers `r9` and `r5` are met, updates a frame, and then jumps back to the start of the loop.

; drawing loop program
; initialization
  LDI r13, 3907
  LDI r5, 4059
  LDI r7, 64
  LDI r3, 996
  LDI r14, 1
main_0:
  LDI r6, 0xF358FD
  LDI r13, 4
  LDI r1, 256
  TEXT r6, r13, r1, "HELLO"
  CMPI r9, 121
  CMP r5, r4
  FRAME
  JMP main_0
