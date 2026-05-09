; DESCRIPTION: Sets a single red pixel at (85, 228).
; PLAN: r0=85(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 228
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
