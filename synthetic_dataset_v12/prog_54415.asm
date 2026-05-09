; DESCRIPTION: Composite: Places a green circle of radius 36 at center (81, 181) then Renders a yellow line between points (415, 189) and (316, 47) then Draws a purple rectangle at (334, 76) with width 87 and height 82.
; PLAN: r0=81(x), r1=181(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=189(y1), r7=316(x2), r8=47(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=76(y), r12=87(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 181
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 189
LDI r7, 316
LDI r8, 47
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 76
LDI r12, 87
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
