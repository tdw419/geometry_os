; DESCRIPTION: Sets a single white pixel at (17, 33).
; PLAN: r0=17(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
