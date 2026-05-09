; DESCRIPTION: Places a blue dot at position (84, 23).
; PLAN: r0=84(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 23
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
