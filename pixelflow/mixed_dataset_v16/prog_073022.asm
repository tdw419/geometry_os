; DESCRIPTION: Sets a single blue pixel at (69, 100).
; PLAN: r0=69(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
