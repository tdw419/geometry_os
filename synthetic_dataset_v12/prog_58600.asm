; DESCRIPTION: Sets a single red pixel at (218, 121).
; PLAN: r0=218(x), r1=121(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 121
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
