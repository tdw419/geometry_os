; DESCRIPTION: Sets a single orange pixel at (220, 8).
; PLAN: r0=220(x), r1=8(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 8
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
