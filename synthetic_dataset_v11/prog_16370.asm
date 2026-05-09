; DESCRIPTION: Sets a single orange pixel at (80, 29).
; PLAN: r0=80(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
