; DESCRIPTION: Places a orange dot at position (80, 44).
; PLAN: r0=80(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
