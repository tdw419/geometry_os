; DESCRIPTION: Sets a single red pixel at (367, 168).
; PLAN: r0=367(x), r1=168(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 168
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
