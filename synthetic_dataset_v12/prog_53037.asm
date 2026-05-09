; DESCRIPTION: Places a orange dot at position (127, 232).
; PLAN: r0=127(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
