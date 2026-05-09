; DESCRIPTION: Sets a single red pixel at (236, 104).
; PLAN: r0=236(x), r1=104(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 104
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
