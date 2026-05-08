; DESCRIPTION: This GeOS assembly code initializes a drawing loop that sets up a color palette and displays text on the screen. The program continuously waits for a specific key press to execute additional drawing commands, updating the display with new text and frames.

; drawing loop program
; initialization
  LDI r6, 0
  LDI r0, 1
  LDI r11, 0x120410
; palette
  LDI r1, 0x3058
  LDI r15, 1
  LDI r5, 0x0000FF
  STORE r1, r5
  ADD r1, r1, r15
  LDI r5, 0x000066
  STORE r1, r5
  ADD r1, r1, r15
  LDI r5, 0x000066
  STORE r1, r5
  ADD r1, r1, r15
  LDI r5, 0x550077
  STORE r1, r5
  ADD r1, r1, r15
main_0:
  ADDI r7, r11, 0x6A11B4
  LDI r7, 64
  LDI r0, 1028
  LDI r5, 0x371F6C
  TEXT r7, r0, r5, "HELLO"
  IKEY r3
  CMPI r3, 0xD4BA7C
  JNZ r3, key_1
  SHL r15, r14, r1
  SHL r13, r5, r6
  SAR r9, r13, r5
  LDI r7, 4
  LDI r10, 0x644CAF
  LDI r10, 825
  DRAWTEXT r7, r10, r10, "WORLD"
  LDI r14, 8
  LDI r15, 1038
  LDI r6, 1057
  TEXT r14, r15, r6, "HELLO"
  FRAME
  JMP main_0
