; DESCRIPTION: Composite: Places a white circle of radius 43 at center (204, 132) then Creates a blue rectangular region at (108, 70) spanning 61 by 114 pixels then Renders a red line between points (328, 116) and (204, 56).
; PLAN: r0=204(x), r1=132(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=70(y), r7=61(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x1), r11=116(y1), r12=204(x2), r13=56(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 132
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 70
LDI r7, 61
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 116
LDI r12, 204
LDI r13, 56
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
