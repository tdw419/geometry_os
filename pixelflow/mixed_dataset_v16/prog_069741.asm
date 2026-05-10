; DESCRIPTION: Composite: Draws a blue line from (223, 77) to (457, 94) then Creates a blue circular shape at (299, 116) with radius 33 then Draws a magenta rectangle at (118, 135) with width 118 and height 96.
; PLAN: r0=223(x1), r1=77(y1), r2=457(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=116(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=135(y), r12=118(width), r13=96(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 77
LDI r2, 457
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 116
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 135
LDI r12, 118
LDI r13, 96
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
