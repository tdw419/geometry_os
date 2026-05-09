; DESCRIPTION: Places a orange dot at position (366, 217).
; PLAN: r0=366(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
