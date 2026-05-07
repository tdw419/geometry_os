; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. It repeatedly checks for a keyboard input ('s') to trigger a frame update, displaying the text "HELLO" on the screen at specified coordinates.

; drawing loop program
; initialization
  LDI r3, 0x826217
  LDI r5, 255
  LDI r11, 0xFA3EB5
  LDI r14, 128
  LDI r9, 232
  LDI r7, 0x931531
  LDI r4, 0x8A05C0
  LDI r0, 4
main_0:
  CMPI r25, 256
  LDI r15, 0x5B39F6
  LDI r5, 3753
  LDI r3, 0x6FC7B4
  TEXT r15, r5, r3, "HELLO"
  IKEY r8
  CMPI r8, 0x7323A4
  JNZ r8, key_1
  FRAME
  JMP main_0
