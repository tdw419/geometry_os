; DESCRIPTION: Composite: Draws a black circle centered at (410, 184) with radius 58 then Renders a magenta box of size 118x119 starting at (316, 126) then Places a blue line segment connecting (203, 134) to (226, 98).
; PLAN: r0=410(x), r1=184(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=126(y), r7=118(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=134(y1), r12=226(x2), r13=98(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 184
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 126
LDI r7, 118
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 134
LDI r12, 226
LDI r13, 98
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
