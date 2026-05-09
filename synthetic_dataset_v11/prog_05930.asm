; DESCRIPTION: Sets a single yellow pixel at (138, 219).
; PLAN: r0=138(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
