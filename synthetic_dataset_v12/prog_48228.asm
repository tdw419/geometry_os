; DESCRIPTION: Sets a single orange pixel at (404, 211).
; PLAN: r0=404(x), r1=211(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 404
LDI r1, 211
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
