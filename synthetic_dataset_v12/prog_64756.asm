; DESCRIPTION: Composite: Places a yellow line segment connecting (249, 113) to (307, 141) then Draws a green circle centered at (399, 67) with radius 54 then Renders a orange box of size 73x105 starting at (104, 88).
; PLAN: r0=249(x1), r1=113(y1), r2=307(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=67(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=88(y), r12=73(width), r13=105(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 113
LDI r2, 307
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 67
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 88
LDI r12, 73
LDI r13, 105
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
