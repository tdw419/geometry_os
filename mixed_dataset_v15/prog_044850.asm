; DESCRIPTION: Places a yellow dot at position (90, 118).
; PLAN: r0=90(x), r1=118(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 118
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
