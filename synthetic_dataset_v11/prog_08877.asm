; DESCRIPTION: Sets a single red pixel at (191, 240).
; PLAN: r0=191(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
