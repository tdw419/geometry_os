; DESCRIPTION: Sets a single white pixel at (166, 13).
; PLAN: r0=166(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
