; DESCRIPTION: Sets a single green pixel at (53, 192).
; PLAN: r0=53(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
