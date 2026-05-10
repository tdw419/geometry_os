; DESCRIPTION: Sets a single red pixel at (504, 180).
; PLAN: r0=504(x), r1=180(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 180
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
