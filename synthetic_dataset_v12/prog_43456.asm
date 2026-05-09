; DESCRIPTION: Composite: Creates a blue circular shape at (428, 89) with radius 73 then Draws a green rectangle at (177, 85) with width 13 and height 50 then Renders a red line between points (207, 6) and (248, 153).
; PLAN: r0=428(x), r1=89(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=85(y), r7=13(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x1), r11=6(y1), r12=248(x2), r13=153(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 89
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 85
LDI r7, 13
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 6
LDI r12, 248
LDI r13, 153
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
