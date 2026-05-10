; DESCRIPTION: Sets a single yellow pixel at (430, 222).
; PLAN: r0=430(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
