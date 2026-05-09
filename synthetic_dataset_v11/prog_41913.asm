; DESCRIPTION: Sets a single orange pixel at (214, 88).
; PLAN: r0=214(x), r1=88(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 88
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
