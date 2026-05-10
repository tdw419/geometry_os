; DESCRIPTION: Sets a single red pixel at (24, 27).
; PLAN: r0=24(x), r1=27(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 27
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
