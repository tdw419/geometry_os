; DESCRIPTION: Sets a single magenta pixel at (440, 193).
; PLAN: r0=440(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
