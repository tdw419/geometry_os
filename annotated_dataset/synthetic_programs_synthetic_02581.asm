; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop where it XORs certain registers, updates others, draws the text "WORLD" at a calculated position, and then refreshes the frame. The loop continues indefinitely.

; drawing loop program
; initialization
  LDI r19, 347
  LDI r8, 256
  LDI r2, 0x747D65
  LDI r4, 1116
  LDI r3, 10
  LDI r7, 0x7E65AD
main_0:
  XOR r1, r11, r2
  XOR r29, r6, r3
  LDI r7, 2
  LDI r21, 0x149B4F
  LDI r3, 0x48A09B
  DRAWTEXT r7, r21, r3, "WORLD"
  ADDI r5, r1, 223
  FRAME
  JMP main_0
