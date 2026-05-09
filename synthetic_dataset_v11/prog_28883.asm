; DESCRIPTION: Places a green dot at position (139, 175).
; PLAN: r0=139(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
