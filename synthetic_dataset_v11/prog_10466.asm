; DESCRIPTION: Sets a single orange pixel at (84, 100).
; PLAN: r0=84(x), r1=100(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 100
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
