; DESCRIPTION: Places a blue dot at position (245, 165).
; PLAN: r0=245(x), r1=165(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 165
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
