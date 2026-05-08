; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop (`main_0`) where it compares a register value to `0x81C51E`, loads additional constants, prints the string "HELLO" twice at different memory locations using the `TEXT` instruction, creates a frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r10, 2905
  LDI r0, 2564
  LDI r9, 1403
  LDI r25, 0xD3A159
main_0:
  CMPI r2, 0x81C51E
  LDI r4, 267
  LDI r13, 10
  LDI r12, 4
  TEXT r4, r13, r12, "HELLO"
  LDI r12, 0xCD03B0
  LDI r6, 3078
  LDI r13, 0xE5BDEB
  TEXT r12, r6, r13, "HELLO"
  FRAME
  JMP main_0
