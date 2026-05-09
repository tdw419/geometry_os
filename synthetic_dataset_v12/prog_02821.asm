; DESCRIPTION: Sets a single white pixel at (344, 187).
; PLAN: r0=344(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
