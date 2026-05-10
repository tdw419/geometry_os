; DESCRIPTION: Sets a single green pixel at (63, 5).
; PLAN: r0=63(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
