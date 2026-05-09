; DESCRIPTION: Composite: Draws a magenta circle centered at (223, 84) with radius 76 then Renders a yellow box of size 17x61 starting at (406, 145).
; PLAN: r0=223(x), r1=84(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=145(y), r7=17(width), r8=61(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 84
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 145
LDI r7, 17
LDI r8, 61
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
