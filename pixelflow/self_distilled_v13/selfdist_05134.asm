; DESCRIPTION: Sets a single green pixel at (349, 54).
; PLAN: r0=349(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
