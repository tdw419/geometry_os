; DESCRIPTION: Composite: Places a red circle of radius 50 at center (158, 176) then Draws a yellow line from (465, 149) to (461, 78) then Creates a red rectangular region at (343, 125) spanning 80 by 14 pixels.
; PLAN: r0=158(x), r1=176(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x1), r6=149(y1), r7=461(x2), r8=78(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=343(x), r11=125(y), r12=80(width), r13=14(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 176
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 149
LDI r7, 461
LDI r8, 78
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 125
LDI r12, 80
LDI r13, 14
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
