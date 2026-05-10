; DESCRIPTION: Sets a single red pixel at (365, 134).
; PLAN: r0=365(x), r1=134(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 134
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
