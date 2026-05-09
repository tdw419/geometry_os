; DESCRIPTION: Sets a single white pixel at (298, 14).
; PLAN: r0=298(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
