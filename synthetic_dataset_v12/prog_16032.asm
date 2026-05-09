; DESCRIPTION: Creates a yellow circular shape at (198, 86) with radius 58.
; PLAN: r0=198(x), r1=86(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 86
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
