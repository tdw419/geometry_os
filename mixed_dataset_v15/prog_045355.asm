; DESCRIPTION: Sets a single orange pixel at (294, 253).
; PLAN: r0=294(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 294
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
