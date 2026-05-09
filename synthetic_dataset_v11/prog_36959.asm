; DESCRIPTION: Sets a single red pixel at (99, 149).
; PLAN: r0=99(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
