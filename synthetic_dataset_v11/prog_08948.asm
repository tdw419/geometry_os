; DESCRIPTION: Places a yellow dot at position (142, 145).
; PLAN: r0=142(x), r1=145(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 145
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
