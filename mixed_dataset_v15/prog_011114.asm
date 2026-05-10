; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (275, 138) then Places a blue line segment connecting (58, 195) to (471, 80) then Draws a black rectangle at (202, 94) with width 12 and height 49.
; PLAN: r0=275(x), r1=138(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=195(y1), r7=471(x2), r8=80(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=94(y), r12=12(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 138
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 195
LDI r7, 471
LDI r8, 80
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 94
LDI r12, 12
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
