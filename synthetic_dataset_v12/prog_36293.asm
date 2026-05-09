; DESCRIPTION: Composite: Places a orange line segment connecting (162, 249) to (202, 154) then Creates a red rectangular region at (416, 4) spanning 26 by 20 pixels then Renders a blue disk with center (81, 196) and radius 43.
; PLAN: r0=162(x1), r1=249(y1), r2=202(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=4(y), r7=26(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x), r11=196(y), r12=43(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 162
LDI r1, 249
LDI r2, 202
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 4
LDI r7, 26
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 196
LDI r12, 43
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
