; DESCRIPTION: Places a yellow dot at position (136, 105).
; PLAN: r0=136(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 105
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
