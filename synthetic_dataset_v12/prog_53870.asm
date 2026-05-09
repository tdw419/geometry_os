; DESCRIPTION: Places a blue dot at position (12, 130).
; PLAN: r0=12(x), r1=130(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 130
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
