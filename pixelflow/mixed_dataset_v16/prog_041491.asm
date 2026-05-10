; DESCRIPTION: Sets a single white pixel at (431, 98).
; PLAN: r0=431(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 98
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
