; DESCRIPTION: Sets a single green pixel at (169, 11).
; PLAN: r0=169(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
