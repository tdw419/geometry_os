; DESCRIPTION: Sets a single white pixel at (360, 2).
; PLAN: r0=360(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
