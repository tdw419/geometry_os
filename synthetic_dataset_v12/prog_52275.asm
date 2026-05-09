; DESCRIPTION: Sets a single black pixel at (447, 255).
; PLAN: r0=447(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
HALT
