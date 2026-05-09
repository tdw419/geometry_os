; DESCRIPTION: Sets a single red pixel at (188, 18).
; PLAN: r0=188(x), r1=18(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 18
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
