; DESCRIPTION: Sets a single green pixel at (271, 53).
; PLAN: r0=271(x), r1=53(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 271
LDI r1, 53
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
