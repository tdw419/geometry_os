; DESCRIPTION: Creates a yellow circular shape at (91, 112) with radius 60.
; PLAN: r0=91(x), r1=112(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 112
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
