; DESCRIPTION: Sets a single white pixel at (470, 49).
; PLAN: r0=470(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 470
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
