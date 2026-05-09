; DESCRIPTION: Sets a single red pixel at (190, 215).
; PLAN: r0=190(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
