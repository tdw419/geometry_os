; DESCRIPTION: Sets a single red pixel at (117, 161).
; PLAN: r0=117(x), r1=161(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 161
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
