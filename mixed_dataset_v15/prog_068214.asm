; DESCRIPTION: Sets a single green pixel at (329, 24).
; PLAN: r0=329(x), r1=24(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 24
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
