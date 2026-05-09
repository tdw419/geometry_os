; DESCRIPTION: Sets a single orange pixel at (205, 21).
; PLAN: r0=205(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 21
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
