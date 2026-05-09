; DESCRIPTION: Sets a single yellow pixel at (465, 191).
; PLAN: r0=465(x), r1=191(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 191
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
