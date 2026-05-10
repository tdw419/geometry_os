; DESCRIPTION: Sets a single red pixel at (271, 241).
; PLAN: r0=271(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 271
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
