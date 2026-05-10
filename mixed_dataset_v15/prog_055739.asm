; DESCRIPTION: Sets a single yellow pixel at (74, 142).
; PLAN: r0=74(x), r1=142(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 142
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
