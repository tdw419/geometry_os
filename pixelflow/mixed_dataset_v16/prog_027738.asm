; DESCRIPTION: Places a orange dot at position (79, 110).
; PLAN: r0=79(x), r1=110(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 110
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
