; DESCRIPTION: Composite: Places a blue line segment connecting (431, 194) to (44, 142) then Draws a blue circle centered at (291, 58) with radius 25 then Renders a black box of size 37x97 starting at (68, 83).
; PLAN: r0=431(x1), r1=194(y1), r2=44(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=58(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=83(y), r12=37(width), r13=97(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 194
LDI r2, 44
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 58
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 83
LDI r12, 37
LDI r13, 97
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
