; DESCRIPTION: Composite: Creates a green rectangular region at (301, 27) spanning 28 by 60 pixels then Places a purple line segment connecting (116, 134) to (105, 168) then Creates a yellow circular shape at (430, 95) with radius 37.
; PLAN: r0=301(x), r1=27(y), r2=28(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=134(y1), r7=105(x2), r8=168(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=430(x), r11=95(y), r12=37(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 27
LDI r2, 28
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 134
LDI r7, 105
LDI r8, 168
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 95
LDI r12, 37
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
