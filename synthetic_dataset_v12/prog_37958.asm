; DESCRIPTION: Sets a single white pixel at (218, 114).
; PLAN: r0=218(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
