; DESCRIPTION: Composite: Creates a yellow circular shape at (164, 54) with radius 43 then Renders a yellow box of size 85x41 starting at (317, 194) then Draws a yellow line from (119, 133) to (476, 165).
; PLAN: r0=164(x), r1=54(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=194(y), r7=85(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x1), r11=133(y1), r12=476(x2), r13=165(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 54
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 194
LDI r7, 85
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 133
LDI r12, 476
LDI r13, 165
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
