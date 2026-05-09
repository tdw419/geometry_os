; DESCRIPTION: Sets a single yellow pixel at (54, 254).
; PLAN: r0=54(x), r1=254(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 254
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
