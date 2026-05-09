; DESCRIPTION: Places a orange dot at position (204, 133).
; PLAN: r0=204(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 133
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
