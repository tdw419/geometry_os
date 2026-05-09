; DESCRIPTION: Composite: Draws a blue circle centered at (186, 150) with radius 38 then Renders a blue box of size 116x75 starting at (175, 147).
; PLAN: r0=186(x), r1=150(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=147(y), r7=116(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 150
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 147
LDI r7, 116
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
