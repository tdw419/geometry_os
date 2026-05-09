; DESCRIPTION: Sets a single orange pixel at (255, 12).
; PLAN: r0=255(x), r1=12(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 12
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
