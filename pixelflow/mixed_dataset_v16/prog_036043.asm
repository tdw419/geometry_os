; DESCRIPTION: Sets a single red pixel at (76, 121).
; PLAN: r0=76(x), r1=121(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 121
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
