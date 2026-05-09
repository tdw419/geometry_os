; DESCRIPTION: Sets a single red pixel at (287, 32).
; PLAN: r0=287(x), r1=32(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 32
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
