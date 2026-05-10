; DESCRIPTION: Sets a single white pixel at (426, 160).
; PLAN: r0=426(x), r1=160(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 426
LDI r1, 160
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
