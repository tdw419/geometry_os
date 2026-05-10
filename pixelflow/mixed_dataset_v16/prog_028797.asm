; DESCRIPTION: Composite: Renders a purple box of size 62x22 starting at (412, 142) then Places a white circle of radius 46 at center (355, 80) then Renders a purple line between points (501, 243) and (95, 232).
; PLAN: r0=412(x), r1=142(y), r2=62(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=80(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=501(x1), r11=243(y1), r12=95(x2), r13=232(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 142
LDI r2, 62
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 80
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 501
LDI r11, 243
LDI r12, 95
LDI r13, 232
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
