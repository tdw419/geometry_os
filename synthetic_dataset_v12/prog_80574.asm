; DESCRIPTION: Places a orange dot at position (87, 89).
; PLAN: r0=87(x), r1=89(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 89
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
