; DESCRIPTION: Sets a single cyan pixel at (16, 151).
; PLAN: r0=16(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 151
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
