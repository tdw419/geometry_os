; DESCRIPTION: Sets a single magenta pixel at (491, 253).
; PLAN: r0=491(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
