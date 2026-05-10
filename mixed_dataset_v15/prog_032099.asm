; DESCRIPTION: Sets a single green pixel at (148, 87).
; PLAN: r0=148(x), r1=87(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 87
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
