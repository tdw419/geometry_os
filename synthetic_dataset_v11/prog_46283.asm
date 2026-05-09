; DESCRIPTION: Places a orange dot at position (108, 205).
; PLAN: r0=108(x), r1=205(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 205
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
