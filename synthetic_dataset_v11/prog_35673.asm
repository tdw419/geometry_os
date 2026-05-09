; DESCRIPTION: Sets a single green pixel at (137, 219).
; PLAN: r0=137(x), r1=219(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 219
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
