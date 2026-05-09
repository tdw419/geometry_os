; DESCRIPTION: Sets a single yellow pixel at (60, 214).
; PLAN: r0=60(x), r1=214(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 214
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
