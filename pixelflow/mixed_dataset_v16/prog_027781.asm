; DESCRIPTION: Composite: Renders a magenta disk with center (73, 189) and radius 60 then Draws a red rectangle at (316, 185) with width 100 and height 31.
; PLAN: r0=73(x), r1=189(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=185(y), r7=100(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 189
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 185
LDI r7, 100
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
