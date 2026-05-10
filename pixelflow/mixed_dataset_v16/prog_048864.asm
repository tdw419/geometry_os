; DESCRIPTION: Sets a single white pixel at (318, 46).
; PLAN: r0=318(x), r1=46(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 318
LDI r1, 46
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
