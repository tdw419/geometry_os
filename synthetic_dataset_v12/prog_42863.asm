; DESCRIPTION: Composite: Creates a black rectangular region at (202, 90) spanning 101 by 72 pixels then Renders a blue disk with center (237, 136) and radius 63 then Renders a red line between points (456, 86) and (297, 129).
; PLAN: r0=202(x), r1=90(y), r2=101(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=136(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=456(x1), r11=86(y1), r12=297(x2), r13=129(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 90
LDI r2, 101
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 136
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 456
LDI r11, 86
LDI r12, 297
LDI r13, 129
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
