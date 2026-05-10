; DESCRIPTION: Places a orange dot at position (424, 203).
; PLAN: r0=424(x), r1=203(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 203
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
