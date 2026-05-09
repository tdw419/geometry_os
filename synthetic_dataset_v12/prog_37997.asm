; DESCRIPTION: Sets a single orange pixel at (72, 155).
; PLAN: r0=72(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 155
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
