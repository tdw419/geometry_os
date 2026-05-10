; DESCRIPTION: Sets a single yellow pixel at (366, 184).
; PLAN: r0=366(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
