; DESCRIPTION: Sets a single white pixel at (111, 241).
; PLAN: r0=111(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
