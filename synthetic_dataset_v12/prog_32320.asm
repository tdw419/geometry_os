; DESCRIPTION: Places a blue dot at position (299, 23).
; PLAN: r0=299(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 23
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
