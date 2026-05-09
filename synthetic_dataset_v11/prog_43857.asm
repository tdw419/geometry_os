; DESCRIPTION: Sets a single red pixel at (17, 255).
; PLAN: r0=17(x), r1=255(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 255
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
