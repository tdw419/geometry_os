; DESCRIPTION: Places a orange dot at position (94, 150).
; PLAN: r0=94(x), r1=150(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 150
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
