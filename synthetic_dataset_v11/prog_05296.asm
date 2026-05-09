; DESCRIPTION: Sets a single magenta pixel at (88, 17).
; PLAN: r0=88(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
