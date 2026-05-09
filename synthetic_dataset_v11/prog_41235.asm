; DESCRIPTION: Places a orange dot at position (43, 127).
; PLAN: r0=43(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 127
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
