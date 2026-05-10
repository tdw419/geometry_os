; DESCRIPTION: Sets a single yellow pixel at (384, 46).
; PLAN: r0=384(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
