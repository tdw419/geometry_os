; DESCRIPTION: Sets a single white pixel at (296, 161).
; PLAN: r0=296(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
