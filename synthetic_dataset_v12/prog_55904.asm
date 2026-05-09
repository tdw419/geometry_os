; DESCRIPTION: Places a orange dot at position (315, 136).
; PLAN: r0=315(x), r1=136(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 136
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
