; DESCRIPTION: Composite: Renders a yellow disk with center (459, 85) and radius 19 then Draws a green rectangle at (184, 67) with width 91 and height 93 then Draws a cyan line from (444, 106) to (7, 174).
; PLAN: r0=459(x), r1=85(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=67(y), r7=91(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x1), r11=106(y1), r12=7(x2), r13=174(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 85
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 67
LDI r7, 91
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 106
LDI r12, 7
LDI r13, 174
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
