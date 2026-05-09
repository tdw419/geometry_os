; DESCRIPTION: Composite: Draws a blue line from (49, 19) to (119, 176) then Places a white circle of radius 66 at center (187, 77) then Draws a magenta rectangle at (243, 181) with width 78 and height 61.
; PLAN: r0=49(x1), r1=19(y1), r2=119(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=77(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x), r11=181(y), r12=78(width), r13=61(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 19
LDI r2, 119
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 77
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 181
LDI r12, 78
LDI r13, 61
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
