; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=0(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
