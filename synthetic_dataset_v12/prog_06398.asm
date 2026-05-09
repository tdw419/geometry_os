; DESCRIPTION: Sets a single magenta pixel at (422, 193).
; PLAN: r0=422(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
