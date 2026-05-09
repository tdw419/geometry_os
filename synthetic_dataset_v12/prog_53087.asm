; DESCRIPTION: Places a blue dot at position (30, 34).
; PLAN: r0=30(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 34
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
