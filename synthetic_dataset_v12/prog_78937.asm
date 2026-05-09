; DESCRIPTION: Sets a single orange pixel at (113, 93).
; PLAN: r0=113(x), r1=93(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 93
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
