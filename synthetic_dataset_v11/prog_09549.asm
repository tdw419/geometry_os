; DESCRIPTION: Sets a single green pixel at (1, 162).
; PLAN: r0=1(x), r1=162(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 162
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
