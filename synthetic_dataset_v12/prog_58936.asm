; DESCRIPTION: Composite: Draws a green rectangle at (123, 106) with width 82 and height 109 then Draws a cyan circle centered at (97, 86) with radius 78 then Renders a black line between points (60, 186) and (167, 176).
; PLAN: r0=123(x), r1=106(y), r2=82(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=86(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x1), r11=186(y1), r12=167(x2), r13=176(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 106
LDI r2, 82
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 86
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 186
LDI r12, 167
LDI r13, 176
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
