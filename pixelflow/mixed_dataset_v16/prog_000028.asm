; DESCRIPTION: Composite: Creates a yellow rectangular region at (123, 138) spanning 97 by 87 pixels then Renders a purple disk with center (119, 75) and radius 70 then Places a yellow line segment connecting (501, 188) to (403, 53).
; PLAN: r0=123(x), r1=138(y), r2=97(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=75(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=501(x1), r11=188(y1), r12=403(x2), r13=53(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 138
LDI r2, 97
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 75
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 501
LDI r11, 188
LDI r12, 403
LDI r13, 53
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
