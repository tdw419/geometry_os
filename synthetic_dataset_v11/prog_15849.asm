; DESCRIPTION: Sets a single white pixel at (113, 62).
; PLAN: r0=113(x), r1=62(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 62
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
