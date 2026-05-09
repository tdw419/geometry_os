; DESCRIPTION: Sets a single white pixel at (16, 92).
; PLAN: r0=16(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
