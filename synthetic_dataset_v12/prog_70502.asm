; DESCRIPTION: Sets a single orange pixel at (360, 70).
; PLAN: r0=360(x), r1=70(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 70
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
