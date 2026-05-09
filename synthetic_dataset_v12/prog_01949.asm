; DESCRIPTION: Sets a single magenta pixel at (395, 167).
; PLAN: r0=395(x), r1=167(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 167
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
