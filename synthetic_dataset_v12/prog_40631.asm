; DESCRIPTION: Sets a single orange pixel at (231, 227).
; PLAN: r0=231(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
