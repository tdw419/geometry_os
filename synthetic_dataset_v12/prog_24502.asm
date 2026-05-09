; DESCRIPTION: Sets a single orange pixel at (393, 200).
; PLAN: r0=393(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
