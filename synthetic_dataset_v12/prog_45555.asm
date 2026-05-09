; DESCRIPTION: Sets a single orange pixel at (505, 150).
; PLAN: r0=505(x), r1=150(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 150
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
