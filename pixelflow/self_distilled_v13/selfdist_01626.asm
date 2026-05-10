; DESCRIPTION: Sets a single red pixel at (63, 115).
; PLAN: r0=63(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
