; DESCRIPTION: Places a blue dot at position (68, 118).
; PLAN: r0=68(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 118
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
