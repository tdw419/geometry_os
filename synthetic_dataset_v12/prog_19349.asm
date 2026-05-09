; DESCRIPTION: Places a orange dot at position (302, 231).
; PLAN: r0=302(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
