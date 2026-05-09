; DESCRIPTION: Composite: Renders a red disk with center (74, 113) and radius 70 then Renders a yellow line between points (358, 181) and (278, 92) then Creates a blue rectangular region at (321, 6) spanning 78 by 65 pixels.
; PLAN: r0=74(x), r1=113(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x1), r6=181(y1), r7=278(x2), r8=92(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=6(y), r12=78(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 113
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 181
LDI r7, 278
LDI r8, 92
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 6
LDI r12, 78
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
