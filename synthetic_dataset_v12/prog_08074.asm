; DESCRIPTION: Sets a single white pixel at (225, 62).
; PLAN: r0=225(x), r1=62(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 62
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
