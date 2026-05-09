; DESCRIPTION: Sets a single orange pixel at (130, 50).
; PLAN: r0=130(x), r1=50(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 50
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
