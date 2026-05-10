; DESCRIPTION: Places a orange dot at position (241, 74).
; PLAN: r0=241(x), r1=74(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 74
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
