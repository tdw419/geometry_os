; DESCRIPTION: Sets a single red pixel at (152, 81).
; PLAN: r0=152(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
