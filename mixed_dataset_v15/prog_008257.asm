; DESCRIPTION: Sets a single green pixel at (43, 47).
; PLAN: r0=43(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
