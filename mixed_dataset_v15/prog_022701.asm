; DESCRIPTION: Creates a yellow circular shape at (132, 69) with radius 34.
; PLAN: r0=132(x), r1=69(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 69
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
