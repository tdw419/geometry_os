; DESCRIPTION: Sets a single green pixel at (268, 69).
; PLAN: r0=268(x), r1=69(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 69
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
