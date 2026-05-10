; DESCRIPTION: Creates a yellow circular shape at (350, 88) with radius 67.
; PLAN: r0=350(x), r1=88(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 88
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
