; DESCRIPTION: Composite: Draws a red rectangle at (81, 63) with width 63 and height 96 then Places a yellow line segment connecting (438, 155) to (254, 34).
; PLAN: r0=81(x), r1=63(y), r2=63(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=155(y1), r7=254(x2), r8=34(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 63
LDI r2, 63
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 155
LDI r7, 254
LDI r8, 34
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
