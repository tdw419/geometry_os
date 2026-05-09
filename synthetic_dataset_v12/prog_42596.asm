; DESCRIPTION: Sets a single green pixel at (505, 5).
; PLAN: r0=505(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
