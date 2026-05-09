; DESCRIPTION: Sets a single black pixel at (20, 192).
; PLAN: r0=20(x), r1=192(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 192
LDI r2, 0x000000
PSET r0, r1, r2
HALT
