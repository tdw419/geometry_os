; DESCRIPTION: Places a blue dot at position (372, 204).
; PLAN: r0=372(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 204
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
