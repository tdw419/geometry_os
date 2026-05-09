; DESCRIPTION: Sets a single yellow pixel at (248, 180).
; PLAN: r0=248(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 180
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
