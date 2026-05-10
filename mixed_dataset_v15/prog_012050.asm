; DESCRIPTION: Sets a single cyan pixel at (153, 69).
; PLAN: r0=153(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 69
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
