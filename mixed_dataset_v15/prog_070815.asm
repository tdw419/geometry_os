; DESCRIPTION: Sets a single yellow pixel at (154, 240).
; PLAN: r0=154(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 240
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
