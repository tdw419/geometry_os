; DESCRIPTION: Creates a yellow circular shape at (207, 112) with radius 67.
; PLAN: r0=207(x), r1=112(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 112
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
