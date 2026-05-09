; DESCRIPTION: Sets a single orange pixel at (402, 80).
; PLAN: r0=402(x), r1=80(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 80
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
