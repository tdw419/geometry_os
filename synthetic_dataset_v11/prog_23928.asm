; DESCRIPTION: Places a orange dot at position (253, 101).
; PLAN: r0=253(x), r1=101(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 101
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
