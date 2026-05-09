; DESCRIPTION: Composite: Renders a purple line between points (222, 115) and (417, 165) then Draws a orange rectangle at (353, 130) with width 87 and height 58.
; PLAN: r0=222(x1), r1=115(y1), r2=417(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=130(y), r7=87(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 115
LDI r2, 417
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 130
LDI r7, 87
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
