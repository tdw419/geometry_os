; DESCRIPTION: Sets a single white pixel at (315, 108).
; PLAN: r0=315(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
