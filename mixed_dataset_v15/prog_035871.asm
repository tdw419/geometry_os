; DESCRIPTION: Sets a single white pixel at (218, 49).
; PLAN: r0=218(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
