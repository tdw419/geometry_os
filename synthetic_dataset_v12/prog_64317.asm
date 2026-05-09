; DESCRIPTION: Creates a yellow circular shape at (385, 77) with radius 54.
; PLAN: r0=385(x), r1=77(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 77
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
