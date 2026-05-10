; DESCRIPTION: Sets a single green pixel at (301, 107).
; PLAN: r0=301(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 301
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
