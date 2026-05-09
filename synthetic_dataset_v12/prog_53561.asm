; DESCRIPTION: Sets a single red pixel at (240, 80).
; PLAN: r0=240(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
