; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it repeatedly draws the text "WORLD" at coordinates (703, 2) on the screen with a color value of 3960. It then performs bitwise operations involving register values before refreshing the frame and jumping back to the start of the loop.

; input driven program
; initialization
  LDI r3, 64
  LDI r4, 2
  LDI r14, 64
main_0:
  LDI r8, 703
  LDI r7, 2
  LDI r3, 3960
  DRAWTEXT r8, r7, r3, "WORLD"
  SUBI r10, r8, 256
  OR r13, r10, r0
  AND r15, r9, r8
  FRAME
  JMP main_0
