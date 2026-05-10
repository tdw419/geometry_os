; DESCRIPTION: Places a orange dot at position (409, 209).
; PLAN: r0=409(x), r1=209(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 409
LDI r1, 209
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
