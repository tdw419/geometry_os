; DESCRIPTION: Composite: Draws a yellow rectangle at (377, 82) with width 53 and height 106 then Draws a purple circle centered at (391, 200) with radius 34 then Places a red line segment connecting (500, 47) to (499, 37).
; PLAN: r0=377(x), r1=82(y), r2=53(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=200(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=47(y1), r12=499(x2), r13=37(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 82
LDI r2, 53
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 200
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 47
LDI r12, 499
LDI r13, 37
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
