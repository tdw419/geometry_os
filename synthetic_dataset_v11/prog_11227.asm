; DESCRIPTION: Sets a single yellow pixel at (54, 171).
; PLAN: r0=54(x), r1=171(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 171
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
