; DESCRIPTION: Composite: Draws a black rectangle at (208, 6) with width 85 and height 47 then Creates a blue circular shape at (323, 165) with radius 76 then Renders a orange line between points (391, 164) and (401, 2).
; PLAN: r0=208(x), r1=6(y), r2=85(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=165(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x1), r11=164(y1), r12=401(x2), r13=2(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 6
LDI r2, 85
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 165
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 164
LDI r12, 401
LDI r13, 2
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
