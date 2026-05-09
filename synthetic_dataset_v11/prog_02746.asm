; DESCRIPTION: Places a orange dot at position (161, 252).
; PLAN: r0=161(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
