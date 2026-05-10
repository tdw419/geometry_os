; DESCRIPTION: Composite: Draws a green circle centered at (69, 229) with radius 15 then Renders a blue box of size 62x107 starting at (172, 92).
; PLAN: r0=69(x), r1=229(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=92(y), r7=62(width), r8=107(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 229
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 92
LDI r7, 62
LDI r8, 107
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
