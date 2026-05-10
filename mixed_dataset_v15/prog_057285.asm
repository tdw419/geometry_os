; DESCRIPTION: Composite: Draws a black line from (269, 35) to (338, 100) then Renders a purple disk with center (103, 83) and radius 26 then Creates a white rectangular region at (68, 94) spanning 91 by 60 pixels.
; PLAN: r0=269(x1), r1=35(y1), r2=338(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=83(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=94(y), r12=91(width), r13=60(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 35
LDI r2, 338
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 83
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 94
LDI r12, 91
LDI r13, 60
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
