; DESCRIPTION: Sets a single purple pixel at (168, 228).
; PLAN: r0=168(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
