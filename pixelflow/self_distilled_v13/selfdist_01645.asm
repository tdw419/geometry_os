; DESCRIPTION: Places a orange dot at position (232, 172).
; PLAN: r0=232(x), r1=172(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 172
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
