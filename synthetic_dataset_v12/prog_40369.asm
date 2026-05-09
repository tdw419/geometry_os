; DESCRIPTION: Places a blue dot at position (93, 25).
; PLAN: r0=93(x), r1=25(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 25
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
