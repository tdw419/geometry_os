; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=2(x), r1=1(y1), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
