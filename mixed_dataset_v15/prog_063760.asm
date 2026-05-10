; DESCRIPTION: Places a orange dot at position (181, 150).
; PLAN: r0=181(x), r1=150(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 150
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
