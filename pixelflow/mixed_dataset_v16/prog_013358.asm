; DESCRIPTION: Composite: Creates a yellow circular shape at (163, 110) with radius 60 then Renders a magenta line between points (383, 118) and (1, 222) then Draws a orange rectangle at (67, 235) with width 22 and height 16.
; PLAN: r0=163(x), r1=110(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x1), r6=118(y1), r7=1(x2), r8=222(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=235(y), r12=22(width), r13=16(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 110
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 118
LDI r7, 1
LDI r8, 222
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 235
LDI r12, 22
LDI r13, 16
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
