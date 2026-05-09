; DESCRIPTION: Sets a single orange pixel at (290, 237).
; PLAN: r0=290(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
