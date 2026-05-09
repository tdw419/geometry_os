; DESCRIPTION: Sets a single black pixel at (33, 192).
; PLAN: r0=33(x), r1=192(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 192
LDI r2, 0x000000
PSET r0, r1, r2
HALT
