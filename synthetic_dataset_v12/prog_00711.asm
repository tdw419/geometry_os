; DESCRIPTION: Sets a single yellow pixel at (69, 16).
; PLAN: r0=69(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
