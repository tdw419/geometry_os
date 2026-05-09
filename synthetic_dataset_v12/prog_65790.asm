; DESCRIPTION: Sets a single white pixel at (296, 169).
; PLAN: r0=296(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 169
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
