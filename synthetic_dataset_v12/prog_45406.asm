; DESCRIPTION: Places a orange dot at position (282, 136).
; PLAN: r0=282(x), r1=136(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 282
LDI r1, 136
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
