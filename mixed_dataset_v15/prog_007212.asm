; DESCRIPTION: Sets a single cyan pixel at (104, 67).
; PLAN: r0=104(x), r1=67(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 67
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
