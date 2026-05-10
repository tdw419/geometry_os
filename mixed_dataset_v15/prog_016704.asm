; DESCRIPTION: Composite: Places a black line segment connecting (54, 207) to (117, 53) then Creates a green circular shape at (313, 98) with radius 28 then Creates a green rectangular region at (55, 29) spanning 59 by 76 pixels.
; PLAN: r0=54(x1), r1=207(y1), r2=117(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=98(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=29(y), r12=59(width), r13=76(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 207
LDI r2, 117
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 98
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 29
LDI r12, 59
LDI r13, 76
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
