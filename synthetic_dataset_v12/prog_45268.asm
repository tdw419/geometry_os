; DESCRIPTION: Sets a single orange pixel at (336, 152).
; PLAN: r0=336(x), r1=152(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 152
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
