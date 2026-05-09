; DESCRIPTION: Sets a single green pixel at (213, 105).
; PLAN: r0=213(x), r1=105(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 105
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
