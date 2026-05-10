; DESCRIPTION: Sets a single red pixel at (26, 50).
; PLAN: r0=26(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
