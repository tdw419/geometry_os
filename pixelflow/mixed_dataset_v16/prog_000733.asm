; DESCRIPTION: Sets a single orange pixel at (464, 130).
; PLAN: r0=464(x), r1=130(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 130
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
