; DESCRIPTION: Sets a single red pixel at (435, 115).
; PLAN: r0=435(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 435
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
