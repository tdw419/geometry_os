; DESCRIPTION: Creates a yellow circular shape at (103, 77) with radius 58.
; PLAN: r0=103(x), r1=77(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 77
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
