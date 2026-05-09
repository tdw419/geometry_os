; DESCRIPTION: Sets a single magenta pixel at (428, 129).
; PLAN: r0=428(x), r1=129(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 129
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
