; DESCRIPTION: Composite: Places a black line segment connecting (233, 7) to (406, 165) then Renders a yellow disk with center (382, 72) and radius 43 then Creates a green rectangular region at (28, 123) spanning 81 by 69 pixels.
; PLAN: r0=233(x1), r1=7(y1), r2=406(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=72(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=123(y), r12=81(width), r13=69(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 7
LDI r2, 406
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 72
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 123
LDI r12, 81
LDI r13, 69
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
