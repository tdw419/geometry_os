; DESCRIPTION: Places a orange dot at position (337, 207).
; PLAN: r0=337(x), r1=207(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 337
LDI r1, 207
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
