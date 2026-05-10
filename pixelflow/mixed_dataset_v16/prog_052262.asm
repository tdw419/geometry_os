; DESCRIPTION: Sets a single orange pixel at (68, 125).
; PLAN: r0=68(x), r1=125(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 125
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
