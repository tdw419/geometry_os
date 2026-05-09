; DESCRIPTION: Sets a single orange pixel at (33, 206).
; PLAN: r0=33(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
