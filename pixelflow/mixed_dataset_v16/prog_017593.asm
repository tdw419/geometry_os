; DESCRIPTION: Composite: Draws a red rectangle at (2, 81) with width 117 and height 86 then Draws a magenta line from (25, 13) to (323, 184) then Renders a magenta disk with center (97, 190) and radius 29.
; PLAN: r0=2(x), r1=81(y), r2=117(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x1), r6=13(y1), r7=323(x2), r8=184(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=190(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 81
LDI r2, 117
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 13
LDI r7, 323
LDI r8, 184
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 190
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
