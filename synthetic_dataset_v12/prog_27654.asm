; DESCRIPTION: Sets a single orange pixel at (495, 182).
; PLAN: r0=495(x), r1=182(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 182
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
