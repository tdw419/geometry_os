; DESCRIPTION: Composite: Renders a orange disk with center (243, 106) and radius 76 then Draws a purple rectangle at (83, 119) with width 118 and height 42 then Draws a black line from (206, 135) to (466, 182).
; PLAN: r0=243(x), r1=106(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=119(y), r7=118(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=135(y1), r12=466(x2), r13=182(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 106
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 119
LDI r7, 118
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 135
LDI r12, 466
LDI r13, 182
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
