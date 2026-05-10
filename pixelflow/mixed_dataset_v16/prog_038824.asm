; DESCRIPTION: Places a blue dot at position (78, 84).
; PLAN: r0=78(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
