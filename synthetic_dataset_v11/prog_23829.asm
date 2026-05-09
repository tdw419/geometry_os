; DESCRIPTION: Sets a single yellow pixel at (150, 166).
; PLAN: r0=150(x), r1=166(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 166
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
