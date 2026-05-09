; DESCRIPTION: Places a yellow circle of radius 62 at center (165, 121).
; PLAN: r0=165(x), r1=121(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 121
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
