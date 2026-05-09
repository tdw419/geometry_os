; DESCRIPTION: Sets a single cyan pixel at (2, 189).
; PLAN: r0=2(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 189
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
