; DESCRIPTION: Sets a single white pixel at (9, 129).
; PLAN: r0=9(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
