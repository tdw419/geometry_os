; DESCRIPTION: Sets a single white pixel at (472, 63).
; PLAN: r0=472(x), r1=63(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 63
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
