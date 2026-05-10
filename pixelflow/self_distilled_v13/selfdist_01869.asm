; DESCRIPTION: Places a blue dot at position (287, 130).
; PLAN: r0=287(x), r1=130(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 130
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
