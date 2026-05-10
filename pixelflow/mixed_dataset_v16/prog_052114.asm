; DESCRIPTION: Sets a single magenta pixel at (257, 59).
; PLAN: r0=257(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 257
LDI r1, 59
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
