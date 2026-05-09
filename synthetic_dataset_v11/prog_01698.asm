; DESCRIPTION: Sets a single yellow pixel at (16, 69).
; PLAN: r0=16(x), r1=69(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 69
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
