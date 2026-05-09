; DESCRIPTION: Sets a single red pixel at (80, 10).
; PLAN: r0=80(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
