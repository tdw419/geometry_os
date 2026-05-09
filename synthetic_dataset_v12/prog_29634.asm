; DESCRIPTION: Creates a yellow circular shape at (135, 196) with radius 54.
; PLAN: r0=135(x), r1=196(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 196
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
