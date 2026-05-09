; DESCRIPTION: Places a orange dot at position (165, 148).
; PLAN: r0=165(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
