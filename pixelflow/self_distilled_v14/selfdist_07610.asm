; DESCRIPTION: Sets a single white pixel at (366, 83).
; PLAN: r0=366(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
