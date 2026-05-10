; DESCRIPTION: Sets a single white pixel at (241, 146).
; PLAN: r0=241(x), r1=146(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 146
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
