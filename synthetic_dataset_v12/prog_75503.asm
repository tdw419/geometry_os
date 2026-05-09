; DESCRIPTION: Composite: Creates a green circular shape at (279, 176) with radius 40 then Draws a cyan rectangle at (191, 34) with width 106 and height 92 then Renders a orange line between points (12, 195) and (123, 187).
; PLAN: r0=279(x), r1=176(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=34(y), r7=106(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=12(x1), r11=195(y1), r12=123(x2), r13=187(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 176
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 34
LDI r7, 106
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 195
LDI r12, 123
LDI r13, 187
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
