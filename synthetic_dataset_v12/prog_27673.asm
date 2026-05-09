; DESCRIPTION: Sets a single orange pixel at (366, 97).
; PLAN: r0=366(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
