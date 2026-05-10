; DESCRIPTION: Sets a single purple pixel at (464, 168).
; PLAN: r0=464(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
