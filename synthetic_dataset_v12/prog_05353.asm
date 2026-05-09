; DESCRIPTION: Creates a yellow circular shape at (353, 175) with radius 54.
; PLAN: r0=353(x), r1=175(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 175
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
