; DESCRIPTION: Creates a yellow circular shape at (90, 156) with radius 70.
; PLAN: r0=90(x), r1=156(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 156
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
