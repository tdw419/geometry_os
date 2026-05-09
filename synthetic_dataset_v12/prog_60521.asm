; DESCRIPTION: Sets a single yellow pixel at (506, 175).
; PLAN: r0=506(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 506
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
