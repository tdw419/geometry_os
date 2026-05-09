; DESCRIPTION: Sets a single orange pixel at (435, 145).
; PLAN: r0=435(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 435
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
