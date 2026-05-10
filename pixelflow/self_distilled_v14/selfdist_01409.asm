; DESCRIPTION: Sets a single orange pixel at (46, 171).
; PLAN: r0=46(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
