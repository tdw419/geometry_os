; DESCRIPTION: Sets a single yellow pixel at (69, 32).
; PLAN: r0=69(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 32
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
