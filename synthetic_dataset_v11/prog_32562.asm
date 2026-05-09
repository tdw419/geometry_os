; DESCRIPTION: Sets a single yellow pixel at (211, 134).
; PLAN: r0=211(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
