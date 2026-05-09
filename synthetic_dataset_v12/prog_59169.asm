; DESCRIPTION: Sets a single red pixel at (149, 160).
; PLAN: r0=149(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
