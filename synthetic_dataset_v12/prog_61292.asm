; DESCRIPTION: Sets a single blue pixel at (357, 182).
; PLAN: r0=357(x), r1=182(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 357
LDI r1, 182
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
