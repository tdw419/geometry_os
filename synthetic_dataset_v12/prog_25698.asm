; DESCRIPTION: Sets a single white pixel at (37, 244).
; PLAN: r0=37(x), r1=244(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 244
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
