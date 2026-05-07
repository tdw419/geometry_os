; DESCRIPTION: The provided GeOS assembly code initializes several registers with specific values and then calls the `FILL` function to fill a region of memory starting at address 1397. The program then halts execution.

; simple draw program
; initialization
  LDI r5, 2805
  LDI r6, 256
  LDI r11, 0xC6CB08
  LDI r3, 2750
  LDI r8, 0xB3D568
  LDI r12, 0x875DBE
  LDI r0, 1397
  FILL r0
  HALT
