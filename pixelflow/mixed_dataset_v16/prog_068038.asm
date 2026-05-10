; DESCRIPTION: Sets a single yellow pixel at (244, 179).
; PLAN: r0=244(x), r1=179(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 179
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
