; DESCRIPTION: Sets a single white pixel at (129, 85).
; PLAN: r0=129(x), r1=85(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 85
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
