; DESCRIPTION: Sets a single orange pixel at (188, 86).
; PLAN: r0=188(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
