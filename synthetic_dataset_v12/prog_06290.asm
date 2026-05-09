; DESCRIPTION: Sets a single orange pixel at (487, 91).
; PLAN: r0=487(x), r1=91(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 91
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
