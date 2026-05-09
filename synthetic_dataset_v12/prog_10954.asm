; DESCRIPTION: Composite: Renders a magenta disk with center (312, 30) and radius 24 then Draws a orange rectangle at (377, 101) with width 48 and height 12.
; PLAN: r0=312(x), r1=30(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=101(y), r7=48(width), r8=12(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 30
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 101
LDI r7, 48
LDI r8, 12
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
