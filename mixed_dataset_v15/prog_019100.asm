; DESCRIPTION: Sets a single orange pixel at (63, 54).
; PLAN: r0=63(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
