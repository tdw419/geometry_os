; DESCRIPTION: Sets a single red pixel at (173, 110).
; PLAN: r0=173(x), r1=110(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 110
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
