; DESCRIPTION: Sets a single red pixel at (146, 4).
; PLAN: r0=146(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
