; DESCRIPTION: Sets a single red pixel at (22, 38).
; PLAN: r0=22(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
