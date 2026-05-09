; DESCRIPTION: Sets a single white pixel at (307, 78).
; PLAN: r0=307(x), r1=78(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 78
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
