; DESCRIPTION: Places a yellow dot at position (137, 175).
; PLAN: r0=137(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
