; DESCRIPTION: Sets a single yellow pixel at (148, 91).
; PLAN: r0=148(x), r1=91(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 91
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
