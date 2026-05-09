; DESCRIPTION: Composite: Places a magenta line segment connecting (457, 34) to (210, 141) then Draws a purple circle centered at (254, 105) with radius 70 then Draws a cyan rectangle at (279, 5) with width 55 and height 38.
; PLAN: r0=457(x1), r1=34(y1), r2=210(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=105(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=5(y), r12=55(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 34
LDI r2, 210
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 105
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 5
LDI r12, 55
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
