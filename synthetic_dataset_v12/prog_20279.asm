; DESCRIPTION: Composite: Creates a green rectangular region at (358, 7) spanning 69 by 116 pixels then Renders a blue line between points (353, 165) and (289, 130) then Renders a magenta disk with center (339, 189) and radius 44.
; PLAN: r0=358(x), r1=7(y), r2=69(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=165(y1), r7=289(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=189(y), r12=44(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 7
LDI r2, 69
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 165
LDI r7, 289
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 189
LDI r12, 44
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
