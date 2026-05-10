; DESCRIPTION: Composite: Places a cyan line segment connecting (399, 198) to (58, 15) then Creates a blue circular shape at (233, 135) with radius 65 then Draws a magenta rectangle at (169, 111) with width 81 and height 58.
; PLAN: r0=399(x1), r1=198(y1), r2=58(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=135(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=169(x), r11=111(y), r12=81(width), r13=58(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 198
LDI r2, 58
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 135
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 169
LDI r11, 111
LDI r12, 81
LDI r13, 58
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
