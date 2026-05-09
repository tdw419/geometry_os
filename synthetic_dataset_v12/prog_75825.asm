; DESCRIPTION: Sets a single orange pixel at (138, 113).
; PLAN: r0=138(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
