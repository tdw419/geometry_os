; DESCRIPTION: Sets a single magenta pixel at (43, 223).
; PLAN: r0=43(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 223
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
