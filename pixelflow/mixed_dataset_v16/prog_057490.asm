; DESCRIPTION: Sets a single yellow pixel at (103, 193).
; PLAN: r0=103(x), r1=193(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 193
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
