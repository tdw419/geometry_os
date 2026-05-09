; DESCRIPTION: Composite: Draws a yellow line from (472, 95) to (81, 244) then Creates a black circular shape at (63, 99) with radius 60 then Renders a cyan box of size 67x63 starting at (88, 121).
; PLAN: r0=472(x1), r1=95(y1), r2=81(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=99(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x), r11=121(y), r12=67(width), r13=63(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 95
LDI r2, 81
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 99
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 121
LDI r12, 67
LDI r13, 63
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
