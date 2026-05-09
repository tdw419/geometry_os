; DESCRIPTION: Sets a single orange pixel at (224, 169).
; PLAN: r0=224(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
