; DESCRIPTION: Sets a single white pixel at (341, 50).
; PLAN: r0=341(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
