; DESCRIPTION: Sets a single red pixel at (259, 160).
; PLAN: r0=259(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 259
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
