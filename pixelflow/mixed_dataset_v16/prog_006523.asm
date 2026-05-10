; DESCRIPTION: Places a blue dot at position (422, 227).
; PLAN: r0=422(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
