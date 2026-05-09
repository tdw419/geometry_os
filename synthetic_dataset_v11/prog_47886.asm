; DESCRIPTION: Places a blue dot at position (34, 18).
; PLAN: r0=34(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
