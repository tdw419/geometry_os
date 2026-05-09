; DESCRIPTION: Composite: Renders a black line between points (374, 16) and (335, 216) then Creates a black circular shape at (294, 188) with radius 67 then Creates a black rectangular region at (191, 58) spanning 29 by 105 pixels.
; PLAN: r0=374(x1), r1=16(y1), r2=335(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=188(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x), r11=58(y), r12=29(width), r13=105(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 16
LDI r2, 335
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 188
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 58
LDI r12, 29
LDI r13, 105
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
