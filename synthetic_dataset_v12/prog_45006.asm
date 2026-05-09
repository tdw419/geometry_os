; DESCRIPTION: Places a yellow circle of radius 38 at center (108, 100).
; PLAN: r0=108(x), r1=100(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 100
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
