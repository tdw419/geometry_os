; DESCRIPTION: Draws a yellow circle centered at (264, 194) with radius 54.
; PLAN: r0=264(x), r1=194(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 194
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
