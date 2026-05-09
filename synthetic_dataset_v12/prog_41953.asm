; DESCRIPTION: Sets a single red pixel at (88, 123).
; PLAN: r0=88(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
