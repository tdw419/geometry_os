; DESCRIPTION: Sets a single red pixel at (108, 253).
; PLAN: r0=108(x), r1=253(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 253
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
