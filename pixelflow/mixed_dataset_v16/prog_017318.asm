; DESCRIPTION: Sets a single red pixel at (67, 25).
; PLAN: r0=67(x), r1=25(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 25
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
