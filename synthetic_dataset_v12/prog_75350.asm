; DESCRIPTION: Sets a single yellow pixel at (152, 112).
; PLAN: r0=152(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
