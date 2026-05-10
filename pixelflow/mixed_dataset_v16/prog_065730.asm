; DESCRIPTION: Sets a single red pixel at (196, 126).
; PLAN: r0=196(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
