; DESCRIPTION: Places a orange dot at position (91, 119).
; PLAN: r0=91(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
