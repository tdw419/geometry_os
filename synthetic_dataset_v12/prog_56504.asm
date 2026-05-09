; DESCRIPTION: Sets a single white pixel at (465, 176).
; PLAN: r0=465(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
