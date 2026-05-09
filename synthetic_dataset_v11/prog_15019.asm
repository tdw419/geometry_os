; DESCRIPTION: Sets a single cyan pixel at (217, 49).
; PLAN: r0=217(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
