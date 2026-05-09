; DESCRIPTION: Sets a single blue pixel at (54, 182).
; PLAN: r0=54(x), r1=182(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 182
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
