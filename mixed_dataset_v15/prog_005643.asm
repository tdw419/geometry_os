; DESCRIPTION: Composite: Renders a white box of size 38x40 starting at (63, 6) then Draws a blue circle centered at (137, 165) with radius 74.
; PLAN: r0=63(x), r1=6(y), r2=38(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=165(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 6
LDI r2, 38
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 165
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
