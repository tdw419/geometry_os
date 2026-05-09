; DESCRIPTION: Sets a single orange pixel at (4, 51).
; PLAN: r0=4(x), r1=51(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 51
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
