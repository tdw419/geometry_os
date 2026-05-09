; DESCRIPTION: Composite: Places a yellow line segment connecting (185, 64) to (118, 233) then Draws a magenta circle centered at (300, 158) with radius 70 then Renders a green box of size 87x90 starting at (79, 130).
; PLAN: r0=185(x1), r1=64(y1), r2=118(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=158(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=130(y), r12=87(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 64
LDI r2, 118
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 158
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 130
LDI r12, 87
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
