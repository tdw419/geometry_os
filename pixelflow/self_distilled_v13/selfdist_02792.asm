; DESCRIPTION: Sets a single green pixel at (220, 67).
; PLAN: r0=220(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
