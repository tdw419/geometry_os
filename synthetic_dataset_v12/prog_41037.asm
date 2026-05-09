; DESCRIPTION: Composite: Draws a white rectangle at (140, 105) with width 103 and height 40 then Draws a magenta circle centered at (233, 169) with radius 68 then Draws a green line from (311, 190) to (243, 78).
; PLAN: r0=140(x), r1=105(y), r2=103(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=169(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x1), r11=190(y1), r12=243(x2), r13=78(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 105
LDI r2, 103
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 169
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 190
LDI r12, 243
LDI r13, 78
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
