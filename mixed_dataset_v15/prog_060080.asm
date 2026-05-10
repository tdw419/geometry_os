; DESCRIPTION: Sets a single orange pixel at (43, 208).
; PLAN: r0=43(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
