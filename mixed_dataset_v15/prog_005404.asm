; DESCRIPTION: Sets a single red pixel at (280, 106).
; PLAN: r0=280(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 280
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
