; DESCRIPTION: Sets a single orange pixel at (176, 134).
; PLAN: r0=176(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
