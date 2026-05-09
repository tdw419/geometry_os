; DESCRIPTION: Sets a single yellow pixel at (85, 210).
; PLAN: r0=85(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 210
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
