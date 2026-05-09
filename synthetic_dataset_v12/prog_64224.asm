; DESCRIPTION: Creates a yellow circular shape at (160, 109) with radius 29.
; PLAN: r0=160(x), r1=109(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 109
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
