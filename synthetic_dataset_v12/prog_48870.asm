; DESCRIPTION: Sets a single red pixel at (56, 55).
; PLAN: r0=56(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
