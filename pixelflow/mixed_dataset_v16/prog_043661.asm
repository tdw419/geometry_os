; DESCRIPTION: Sets a single orange pixel at (473, 49).
; PLAN: r0=473(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
