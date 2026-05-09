; DESCRIPTION: Sets a single green pixel at (337, 195).
; PLAN: r0=337(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 337
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
