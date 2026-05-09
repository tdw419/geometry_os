; DESCRIPTION: Composite: Creates a white rectangular region at (323, 120) spanning 89 by 81 pixels then Draws a magenta circle centered at (53, 62) with radius 50 then Renders a orange line between points (414, 212) and (470, 200).
; PLAN: r0=323(x), r1=120(y), r2=89(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=62(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x1), r11=212(y1), r12=470(x2), r13=200(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 120
LDI r2, 89
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 62
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 212
LDI r12, 470
LDI r13, 200
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
