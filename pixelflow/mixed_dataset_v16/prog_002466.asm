; DESCRIPTION: Sets a single red pixel at (368, 62).
; PLAN: r0=368(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
