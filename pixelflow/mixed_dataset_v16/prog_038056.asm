; DESCRIPTION: Sets a single black pixel at (332, 228).
; PLAN: r0=332(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
HALT
