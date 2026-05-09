; DESCRIPTION: Sets a single white pixel at (112, 172).
; PLAN: r0=112(x), r1=172(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 172
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
