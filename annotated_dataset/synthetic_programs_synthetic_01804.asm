; DESCRIPTION: The GeOS assembly code initializes several registers and enters a loop where it repeatedly prints the text "HELLO" at different coordinates using the `TEXT` instruction. The loop continues indefinitely, as indicated by the `JMP` instruction to the start of the loop (`main_0`).

; drawing loop program
; initialization
  LDI r2, 0x845311
  LDI r14, 0x44B841
  LDI r5, 0
  LDI r11, 0xE44B21
main_0:
  ANDI r9, r0, 40
  CMPI r12, 140
  LDI r1, 256
  LDI r11, 0x8E577F
  LDI r0, 0x419AD7
  TEXT r1, r11, r0, "HELLO"
  ADDI r9, r13, 0xFD990E
  LDI r12, 16
  LDI r15, 4
  LDI r10, 3315
  TEXT r12, r15, r10, "HELLO"
  CMP r15, r13
  FRAME
  JMP main_0
