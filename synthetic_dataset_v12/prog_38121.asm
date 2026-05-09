; DESCRIPTION: Sets a single yellow pixel at (285, 120).
; PLAN: r0=285(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 285
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
