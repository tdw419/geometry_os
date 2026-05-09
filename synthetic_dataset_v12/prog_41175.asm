; DESCRIPTION: Composite: Places a blue line segment connecting (210, 34) to (250, 207) then Renders a black disk with center (211, 138) and radius 20 then Creates a orange rectangular region at (266, 142) spanning 116 by 37 pixels.
; PLAN: r0=210(x1), r1=34(y1), r2=250(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=138(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x), r11=142(y), r12=116(width), r13=37(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 34
LDI r2, 250
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 138
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 142
LDI r12, 116
LDI r13, 37
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
