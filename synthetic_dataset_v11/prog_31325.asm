; DESCRIPTION: Sets a single magenta pixel at (245, 228).
; PLAN: r0=245(x), r1=228(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 228
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
