; DESCRIPTION: Composite: Draws a cyan circle centered at (88, 102) with radius 76 then Draws a red rectangle at (301, 95) with width 25 and height 85 then Draws a purple line from (127, 125) to (186, 80).
; PLAN: r0=88(x), r1=102(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=95(y), r7=25(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=125(y1), r12=186(x2), r13=80(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 102
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 95
LDI r7, 25
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 125
LDI r12, 186
LDI r13, 80
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
