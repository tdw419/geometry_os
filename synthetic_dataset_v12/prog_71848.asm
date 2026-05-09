; DESCRIPTION: Composite: Draws a magenta circle centered at (227, 82) with radius 54 then Draws a green rectangle at (407, 40) with width 60 and height 81.
; PLAN: r0=227(x), r1=82(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=40(y), r7=60(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 82
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 40
LDI r7, 60
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
