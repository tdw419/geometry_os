; DESCRIPTION: Composite: Draws a green circle centered at (188, 84) with radius 55 then Renders a purple line between points (54, 143) and (505, 134).
; PLAN: r0=188(x), r1=84(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x1), r6=143(y1), r7=505(x2), r8=134(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 84
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 143
LDI r7, 505
LDI r8, 134
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
