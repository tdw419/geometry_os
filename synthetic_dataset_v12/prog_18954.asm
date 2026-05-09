; DESCRIPTION: Composite: Places a yellow line segment connecting (158, 108) to (502, 165) then Creates a red rectangular region at (350, 43) spanning 86 by 74 pixels then Creates a cyan circular shape at (311, 85) with radius 69.
; PLAN: r0=158(x1), r1=108(y1), r2=502(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=43(y), r7=86(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=85(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 108
LDI r2, 502
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 43
LDI r7, 86
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 85
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
