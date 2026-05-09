; DESCRIPTION: Places a orange dot at position (197, 78).
; PLAN: r0=197(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
