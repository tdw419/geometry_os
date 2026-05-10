; DESCRIPTION: Places a blue dot at position (109, 109).
; PLAN: r0=109(x), r1=109(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 109
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
