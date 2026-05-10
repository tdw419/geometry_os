; DESCRIPTION: Sets a single red pixel at (300, 47).
; PLAN: r0=300(x), r1=47(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 300
LDI r1, 47
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
