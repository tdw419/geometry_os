; DESCRIPTION: Composite: Renders a orange disk with center (121, 135) and radius 23 then Draws a green rectangle at (138, 168) with width 101 and height 35 then Draws a red line from (384, 138) to (309, 227).
; PLAN: r0=121(x), r1=135(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=168(y), r7=101(width), r8=35(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x1), r11=138(y1), r12=309(x2), r13=227(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 135
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 168
LDI r7, 101
LDI r8, 35
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 138
LDI r12, 309
LDI r13, 227
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
