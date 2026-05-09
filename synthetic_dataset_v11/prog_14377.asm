; DESCRIPTION: Sets a single magenta pixel at (63, 117).
; PLAN: r0=63(x), r1=117(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 117
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
