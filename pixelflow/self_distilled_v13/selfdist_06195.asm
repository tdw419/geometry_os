; DESCRIPTION: Sets a single red pixel at (246, 107).
; PLAN: r0=246(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 107
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
