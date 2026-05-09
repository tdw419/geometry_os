; DESCRIPTION: Composite: Renders a yellow line between points (221, 212) and (248, 150) then Draws a purple rectangle at (264, 159) with width 114 and height 25.
; PLAN: r0=221(x1), r1=212(y1), r2=248(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=159(y), r7=114(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 212
LDI r2, 248
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 159
LDI r7, 114
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
