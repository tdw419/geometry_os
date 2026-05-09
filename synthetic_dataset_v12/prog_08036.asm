; DESCRIPTION: Composite: Draws a green rectangle at (108, 146) with width 118 and height 108 then Places a yellow line segment connecting (438, 65) to (366, 220).
; PLAN: r0=108(x), r1=146(y), r2=118(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=65(y1), r7=366(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 146
LDI r2, 118
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 65
LDI r7, 366
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
