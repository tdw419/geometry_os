; DESCRIPTION: Sets a single green pixel at (10, 100).
; PLAN: r0=10(x), r1=100(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 100
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
