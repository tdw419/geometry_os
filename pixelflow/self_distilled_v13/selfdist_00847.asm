; DESCRIPTION: Places a green dot at position (371, 16).
; PLAN: r0=371(x), r1=16(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 371
LDI r1, 16
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
