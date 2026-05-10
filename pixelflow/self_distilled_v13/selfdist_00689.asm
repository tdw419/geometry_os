; DESCRIPTION: Sets a single green pixel at (162, 19).
; PLAN: r0=162(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 19
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
