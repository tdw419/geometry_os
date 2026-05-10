; DESCRIPTION: Sets a single white pixel at (338, 54).
; PLAN: r0=338(x), r1=54(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 54
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
