; DESCRIPTION: Sets a single white pixel at (181, 209).
; PLAN: r0=181(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
