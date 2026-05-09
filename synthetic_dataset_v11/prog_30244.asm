; DESCRIPTION: Sets a single green pixel at (63, 225).
; PLAN: r0=63(x), r1=225(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 225
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
