; DESCRIPTION: Sets a single white pixel at (110, 186).
; PLAN: r0=110(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
