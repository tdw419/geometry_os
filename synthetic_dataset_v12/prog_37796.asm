; DESCRIPTION: Sets a single red pixel at (194, 16).
; PLAN: r0=194(x), r1=16(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 16
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
