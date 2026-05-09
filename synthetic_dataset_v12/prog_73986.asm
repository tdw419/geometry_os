; DESCRIPTION: Composite: Renders a red box of size 43x119 starting at (175, 106) then Draws a green line from (220, 161) to (283, 100) then Draws a green circle centered at (233, 180) with radius 70.
; PLAN: r0=175(x), r1=106(y), r2=43(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x1), r6=161(y1), r7=283(x2), r8=100(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=180(y), r12=70(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 106
LDI r2, 43
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 161
LDI r7, 283
LDI r8, 100
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 180
LDI r12, 70
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
