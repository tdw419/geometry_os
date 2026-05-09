; DESCRIPTION: Composite: Draws a green circle centered at (332, 74) with radius 41 then Places a blue line segment connecting (106, 161) to (195, 33) then Draws a blue rectangle at (57, 227) with width 96 and height 18.
; PLAN: r0=332(x), r1=74(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=161(y1), r7=195(x2), r8=33(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=227(y), r12=96(width), r13=18(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 74
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 161
LDI r7, 195
LDI r8, 33
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 227
LDI r12, 96
LDI r13, 18
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
