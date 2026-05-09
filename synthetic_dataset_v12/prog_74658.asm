; DESCRIPTION: Sets a single red pixel at (220, 251).
; PLAN: r0=220(x), r1=251(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 251
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
