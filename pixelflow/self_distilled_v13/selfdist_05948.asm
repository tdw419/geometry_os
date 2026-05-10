; DESCRIPTION: Sets a single yellow pixel at (291, 111).
; PLAN: r0=291(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 111
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
