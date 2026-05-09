; DESCRIPTION: Composite: Places a orange circle of radius 35 at center (38, 189) then Creates a magenta rectangular region at (122, 38) spanning 115 by 117 pixels then Places a purple line segment connecting (126, 220) to (485, 197).
; PLAN: r0=38(x), r1=189(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=38(y), r7=115(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=126(x1), r11=220(y1), r12=485(x2), r13=197(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 189
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 38
LDI r7, 115
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 220
LDI r12, 485
LDI r13, 197
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
