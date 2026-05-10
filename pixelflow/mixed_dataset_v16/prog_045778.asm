; DESCRIPTION: Places a orange disk with center (322, 63) and radius 58.
; PLAN: r0=322(x), r1=63(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 63
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
