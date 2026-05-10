; DESCRIPTION: Composite: Creates a magenta rectangular region at (144, 36) spanning 60 by 74 pixels then Draws a yellow circle centered at (254, 220) with radius 17 then Renders a purple line between points (85, 159) and (160, 30).
; PLAN: r0=144(x), r1=36(y), r2=60(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=220(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x1), r11=159(y1), r12=160(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 36
LDI r2, 60
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 220
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 159
LDI r12, 160
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
