; DESCRIPTION: Places a yellow circle of radius 38 at center (350, 191).
; PLAN: r0=350(x), r1=191(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 191
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
