; DESCRIPTION: Creates a yellow circular shape at (267, 153) with radius 34.
; PLAN: r0=267(x), r1=153(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 153
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
