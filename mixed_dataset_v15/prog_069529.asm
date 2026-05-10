; DESCRIPTION: Sets a single magenta pixel at (510, 229).
; PLAN: r0=510(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 510
LDI r1, 229
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
