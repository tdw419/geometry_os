; DESCRIPTION: Sets a single magenta pixel at (38, 165).
; PLAN: r0=38(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 165
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
