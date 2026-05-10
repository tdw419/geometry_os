; DESCRIPTION: Sets a single red pixel at (481, 6).
; PLAN: r0=481(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
