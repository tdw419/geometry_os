; DESCRIPTION: Sets a single white pixel at (444, 150).
; PLAN: r0=444(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
