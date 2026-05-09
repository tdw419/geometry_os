; DESCRIPTION: Places a orange dot at position (273, 250).
; PLAN: r0=273(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
