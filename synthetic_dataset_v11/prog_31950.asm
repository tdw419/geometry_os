; DESCRIPTION: Places a orange dot at position (65, 59).
; PLAN: r0=65(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
