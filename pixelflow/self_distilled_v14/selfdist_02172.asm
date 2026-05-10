; DESCRIPTION: Places a orange dot at position (45, 161).
; PLAN: r0=45(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 161
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
