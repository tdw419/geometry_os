; DESCRIPTION: Sets a single red pixel at (157, 227).
; PLAN: r0=157(x), r1=227(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 227
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
