; DESCRIPTION: Sets a single orange pixel at (82, 108).
; PLAN: r0=82(x), r1=108(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 108
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
