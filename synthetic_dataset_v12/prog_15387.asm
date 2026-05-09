; DESCRIPTION: Places a blue dot at position (139, 107).
; PLAN: r0=139(x), r1=107(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 107
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
