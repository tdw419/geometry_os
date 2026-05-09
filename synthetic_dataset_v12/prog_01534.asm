; DESCRIPTION: Sets a single cyan pixel at (251, 151).
; PLAN: r0=251(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 151
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
