; DESCRIPTION: Sets a single cyan pixel at (68, 53).
; PLAN: r0=68(x), r1=53(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 53
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
