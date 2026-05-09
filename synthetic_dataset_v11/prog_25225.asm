; DESCRIPTION: Places a blue dot at position (88, 98).
; PLAN: r0=88(x), r1=98(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 98
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
