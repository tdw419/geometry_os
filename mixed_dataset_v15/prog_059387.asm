; DESCRIPTION: Sets a single yellow pixel at (385, 147).
; PLAN: r0=385(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 147
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
