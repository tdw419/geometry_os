; DESCRIPTION: Sets a single magenta pixel at (225, 204).
; PLAN: r0=225(x), r1=204(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 204
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
