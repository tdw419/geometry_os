; DESCRIPTION: Sets a single red pixel at (352, 159).
; PLAN: r0=352(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 159
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
