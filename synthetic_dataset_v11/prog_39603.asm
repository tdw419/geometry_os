; DESCRIPTION: Places a blue dot at position (118, 58).
; PLAN: r0=118(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 58
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
