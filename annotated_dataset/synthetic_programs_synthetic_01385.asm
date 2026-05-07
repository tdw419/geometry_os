; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and fills a memory area of size 256 bytes. It then halts execution.

; simple draw program
; initialization
  LDI r3, 4
  LDI r2, 0x1A8E3A
  LDI r8, 0xDB3EE7
  LDI r7, 0x1833CA
  LDI r28, 256
  FILL r28
  HALT
