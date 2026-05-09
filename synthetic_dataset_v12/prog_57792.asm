; DESCRIPTION: Sets a single red pixel at (328, 215).
; PLAN: r0=328(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
