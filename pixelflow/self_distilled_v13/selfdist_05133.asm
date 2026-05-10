; DESCRIPTION: Renders a yellow circular shape at (276, 30) with radius 34.
; PLAN: r0=276(x), r1=30(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 30
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
