; DESCRIPTION: Sets a single yellow pixel at (146, 30).
; PLAN: r0=146(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
