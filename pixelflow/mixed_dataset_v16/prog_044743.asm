; DESCRIPTION: Sets a single cyan pixel at (141, 49).
; PLAN: r0=141(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
