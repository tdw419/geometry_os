; DESCRIPTION: Places a orange dot at position (1, 3).
; PLAN: r0=1(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
