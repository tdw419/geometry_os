; DESCRIPTION: Sets a single green pixel at (227, 46).
; PLAN: r0=227(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
