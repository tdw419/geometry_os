; DESCRIPTION: Places a orange dot at position (49, 16).
; PLAN: r0=49(x), r1=16(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 16
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
