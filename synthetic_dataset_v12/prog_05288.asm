; DESCRIPTION: Sets a single orange pixel at (391, 38).
; PLAN: r0=391(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
