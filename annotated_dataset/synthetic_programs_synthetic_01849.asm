; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it sets a pixel, draws the text "WORLD" at specific coordinates, shifts bits in registers, and updates the frame. The loop repeats indefinitely.

; drawing loop program
; initialization
  LDI r12, 128
  LDI r13, 0x83710A
  LDI r15, 0x6F15D9
  LDI r7, 255
main_0:
  LDI r3, 8
  LDI r27, 4
  LDI r18, 2
  PSETI
  LDI r0, 0x0188C9
  LDI r9, 0xFA5FAF
  LDI r9, 518
  DRAWTEXT r0, r9, r9, "WORLD"
  SHLI r12, r1, 256
  SHLI r28, r7, 0xEA92FA
  FRAME
  JMP main_0
