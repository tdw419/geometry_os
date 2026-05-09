; DESCRIPTION: Composite: Renders a white disk with center (249, 75) and radius 67 then Creates a white rectangular region at (133, 47) spanning 106 by 21 pixels then Renders a purple line between points (497, 222) and (400, 114).
; PLAN: r0=249(x), r1=75(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=47(y), r7=106(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=222(y1), r12=400(x2), r13=114(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 75
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 47
LDI r7, 106
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 222
LDI r12, 400
LDI r13, 114
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
