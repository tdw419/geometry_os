; DESCRIPTION: Places a blue dot at position (266, 78).
; PLAN: r0=266(x), r1=78(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 78
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
