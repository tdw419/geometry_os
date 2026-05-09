; DESCRIPTION: Places a blue dot at position (233, 99).
; PLAN: r0=233(x), r1=99(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 99
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
