; DESCRIPTION: Places a yellow dot at position (118, 44).
; PLAN: r0=118(x), r1=44(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 44
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
