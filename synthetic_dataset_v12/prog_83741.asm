; DESCRIPTION: Places a yellow circle of radius 21 at center (191, 232).
; PLAN: r0=191(x), r1=232(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 232
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
