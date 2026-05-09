; DESCRIPTION: Composite: Draws a cyan rectangle at (112, 49) with width 88 and height 77 then Places a black line segment connecting (174, 31) to (141, 181) then Creates a blue circular shape at (380, 93) with radius 54.
; PLAN: r0=112(x), r1=49(y), r2=88(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x1), r6=31(y1), r7=141(x2), r8=181(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=93(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 49
LDI r2, 88
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 31
LDI r7, 141
LDI r8, 181
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 93
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
