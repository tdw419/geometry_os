; DESCRIPTION: Places a orange dot at position (422, 174).
; PLAN: r0=422(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
