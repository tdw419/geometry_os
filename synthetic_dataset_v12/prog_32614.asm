; DESCRIPTION: Sets a single orange pixel at (296, 17).
; PLAN: r0=296(x), r1=17(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 17
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
