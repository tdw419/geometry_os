; DESCRIPTION: Sets a single yellow pixel at (60, 196).
; PLAN: r0=60(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
