; DESCRIPTION: Places a orange dot at position (24, 206).
; PLAN: r0=24(x), r1=206(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 206
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
