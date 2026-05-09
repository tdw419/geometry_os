; DESCRIPTION: Composite: Renders a red disk with center (67, 137) and radius 34 then Draws a black rectangle at (15, 62) with width 116 and height 73 then Renders a red line between points (403, 181) and (374, 32).
; PLAN: r0=67(x), r1=137(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=62(y), r7=116(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=403(x1), r11=181(y1), r12=374(x2), r13=32(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 137
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 62
LDI r7, 116
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 181
LDI r12, 374
LDI r13, 32
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
