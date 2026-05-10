; DESCRIPTION: Places a orange dot at position (336, 81).
; PLAN: r0=336(x), r1=81(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 81
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
