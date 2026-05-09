; DESCRIPTION: Sets a single white pixel at (192, 177).
; PLAN: r0=192(x), r1=177(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 177
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
