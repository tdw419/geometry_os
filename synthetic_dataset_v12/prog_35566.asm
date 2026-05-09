; DESCRIPTION: Sets a single orange pixel at (61, 229).
; PLAN: r0=61(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
