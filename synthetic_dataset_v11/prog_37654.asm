; DESCRIPTION: Sets a single orange pixel at (187, 181).
; PLAN: r0=187(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
