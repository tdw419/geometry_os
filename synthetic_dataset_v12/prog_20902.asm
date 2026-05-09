; DESCRIPTION: Sets a single red pixel at (72, 69).
; PLAN: r0=72(x), r1=69(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 69
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
