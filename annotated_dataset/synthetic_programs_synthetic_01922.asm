; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then fills a memory region of size specified in register `r3` (which is set to 379) with the pattern defined by register `r6` (0xA27CD5). The program halts after performing this operation.

; simple draw program
; initialization
  LDI r7, 0x8EC000
  LDI r11, 64
  LDI r6, 0xA27CD5
  LDI r9, 2
  LDI r2, 1812
  LDI r4, 3262
  LDI r3, 379
  FILL r3
  HALT
