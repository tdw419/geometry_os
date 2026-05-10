; DESCRIPTION: Composite: Places a orange line segment connecting (61, 0) to (14, 197) then Draws a green circle centered at (300, 178) with radius 19 then Draws a green rectangle at (73, 196) with width 89 and height 58.
; PLAN: r0=61(x1), r1=0(y1), r2=14(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=178(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x), r11=196(y), r12=89(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 0
LDI r2, 14
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 178
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 196
LDI r12, 89
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
