; DESCRIPTION: Sets a single orange pixel at (51, 111).
; PLAN: r0=51(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 111
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
