; DESCRIPTION: Sets a single white pixel at (222, 147).
; PLAN: r0=222(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
