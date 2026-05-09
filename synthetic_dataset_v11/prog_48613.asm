; DESCRIPTION: Sets a single red pixel at (110, 70).
; PLAN: r0=110(x), r1=70(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 70
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
