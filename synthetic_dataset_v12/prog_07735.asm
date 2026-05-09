; DESCRIPTION: Sets a single red pixel at (23, 164).
; PLAN: r0=23(x), r1=164(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 164
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
