; DESCRIPTION: Sets a single orange pixel at (310, 0).
; PLAN: r0=310(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 310
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
