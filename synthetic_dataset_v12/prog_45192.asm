; DESCRIPTION: Composite: Draws a blue rectangle at (301, 46) with width 65 and height 97 then Creates a green circular shape at (49, 45) with radius 26 then Renders a cyan line between points (358, 31) and (301, 159).
; PLAN: r0=301(x), r1=46(y), r2=65(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=45(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x1), r11=31(y1), r12=301(x2), r13=159(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 46
LDI r2, 65
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 45
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 31
LDI r12, 301
LDI r13, 159
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
