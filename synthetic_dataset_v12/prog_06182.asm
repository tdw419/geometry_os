; DESCRIPTION: Sets a single magenta pixel at (228, 130).
; PLAN: r0=228(x), r1=130(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 130
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
