; DESCRIPTION: Sets a single red pixel at (248, 146).
; PLAN: r0=248(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
