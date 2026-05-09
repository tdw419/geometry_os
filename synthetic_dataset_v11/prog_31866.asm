; DESCRIPTION: Sets a single black pixel at (74, 173).
; PLAN: r0=74(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
HALT
