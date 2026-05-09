; DESCRIPTION: Sets a single yellow pixel at (493, 169).
; PLAN: r0=493(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 169
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
