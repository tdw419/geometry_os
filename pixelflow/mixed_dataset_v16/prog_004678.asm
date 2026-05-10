; DESCRIPTION: Sets a single cyan pixel at (361, 101).
; PLAN: r0=361(x), r1=101(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 361
LDI r1, 101
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
