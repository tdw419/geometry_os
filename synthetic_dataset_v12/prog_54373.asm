; DESCRIPTION: Sets a single cyan pixel at (53, 13).
; PLAN: r0=53(x), r1=13(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 13
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
