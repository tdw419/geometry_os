; DESCRIPTION: Composite: Renders a red line between points (20, 136) and (188, 175) then Places a magenta circle of radius 48 at center (121, 198) then Creates a magenta rectangular region at (245, 48) spanning 10 by 42 pixels.
; PLAN: r0=20(x1), r1=136(y1), r2=188(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=198(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=48(y), r12=10(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 136
LDI r2, 188
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 198
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 48
LDI r12, 10
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
