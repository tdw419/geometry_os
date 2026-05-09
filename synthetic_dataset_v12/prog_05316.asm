; DESCRIPTION: Sets a single magenta pixel at (221, 152).
; PLAN: r0=221(x), r1=152(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 152
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
