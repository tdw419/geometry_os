; DESCRIPTION: Composite: Draws a blue rectangle at (51, 76) with width 85 and height 40 then Places a red circle of radius 73 at center (301, 155) then Renders a yellow line between points (142, 100) and (199, 72).
; PLAN: r0=51(x), r1=76(y), r2=85(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=155(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x1), r11=100(y1), r12=199(x2), r13=72(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 76
LDI r2, 85
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 155
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 100
LDI r12, 199
LDI r13, 72
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
