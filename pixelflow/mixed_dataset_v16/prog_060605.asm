; DESCRIPTION: Sets a single orange pixel at (147, 252).
; PLAN: r0=147(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
