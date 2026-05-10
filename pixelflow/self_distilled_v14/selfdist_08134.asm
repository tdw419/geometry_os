; DESCRIPTION: Places a orange dot at position (330, 47).
; PLAN: r0=330(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 330
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
