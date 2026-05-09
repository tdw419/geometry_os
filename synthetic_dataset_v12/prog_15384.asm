; DESCRIPTION: Places a yellow dot at position (142, 191).
; PLAN: r0=142(x), r1=191(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 191
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
