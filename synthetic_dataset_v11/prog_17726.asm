; DESCRIPTION: Creates a yellow circular shape at (72, 80) with radius 24.
; PLAN: r0=72(x), r1=80(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 80
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
