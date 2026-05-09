; DESCRIPTION: Sets a single red pixel at (239, 248).
; PLAN: r0=239(x), r1=248(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 248
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
