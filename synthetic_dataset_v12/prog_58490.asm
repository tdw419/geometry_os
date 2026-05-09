; DESCRIPTION: Sets a single white pixel at (347, 134).
; PLAN: r0=347(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 347
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
