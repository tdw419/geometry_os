; DESCRIPTION: Sets a single green pixel at (201, 213).
; PLAN: r0=201(x), r1=213(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 213
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
