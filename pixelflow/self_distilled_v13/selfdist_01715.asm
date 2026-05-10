; DESCRIPTION: Sets a single orange pixel at (137, 113).
; PLAN: r0=137(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
