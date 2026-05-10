; DESCRIPTION: Composite: Draws a blue circle centered at (138, 105) with radius 58 then Places a yellow line segment connecting (210, 124) to (479, 172) then Draws a black rectangle at (301, 226) with width 11 and height 28.
; PLAN: r0=138(x), r1=105(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=124(y1), r7=479(x2), r8=172(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=226(y), r12=11(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 105
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 124
LDI r7, 479
LDI r8, 172
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 226
LDI r12, 11
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
