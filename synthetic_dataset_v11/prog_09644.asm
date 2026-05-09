; DESCRIPTION: Sets a single yellow pixel at (70, 99).
; PLAN: r0=70(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
