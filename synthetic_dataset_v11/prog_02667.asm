; DESCRIPTION: Sets a single yellow pixel at (220, 162).
; PLAN: r0=220(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
