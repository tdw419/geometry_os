; DESCRIPTION: Places a blue dot at position (56, 31).
; PLAN: r0=56(x), r1=31(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 31
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
