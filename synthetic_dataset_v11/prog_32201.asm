; DESCRIPTION: Sets a single blue pixel at (74, 33).
; PLAN: r0=74(x), r1=33(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 33
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
