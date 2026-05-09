; DESCRIPTION: Sets a single orange pixel at (321, 46).
; PLAN: r0=321(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
