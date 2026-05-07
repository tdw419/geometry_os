; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it shifts the contents of register `r9` based on the values in `r3` and `r6`, checks for an input key press, and if the key is 128, fills a frame at address `0x0BE1E6` before looping back to the start.

; input driven program
; initialization
  LDI r15, 10
  LDI r21, 87
  LDI r24, 32
  LDI r7, 3854
  LDI r0, 1
  LDI r4, 292
  LDI r2, 0xEA64BC
main_0:
  SHLI r9, r3, 0xF52870
  SHLI r9, r6, 8
  IKEY r15
  CMPI r15, 128
  JNZ r15, key_1
  LDI r5, 0x0BE1E6
  FILL r5
  FRAME
  JMP main_0
