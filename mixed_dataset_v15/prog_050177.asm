; DESCRIPTION: Sets a single orange pixel at (370, 69).
; PLAN: r0=370(x), r1=69(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 69
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
