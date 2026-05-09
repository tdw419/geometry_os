; DESCRIPTION: Composite: Places a orange circle of radius 46 at center (105, 66) then Draws a white rectangle at (314, 85) with width 93 and height 75 then Draws a red line from (277, 183) to (192, 46).
; PLAN: r0=105(x), r1=66(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=85(y), r7=93(width), r8=75(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x1), r11=183(y1), r12=192(x2), r13=46(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 66
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 85
LDI r7, 93
LDI r8, 75
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 183
LDI r12, 192
LDI r13, 46
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
