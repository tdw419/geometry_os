; DESCRIPTION: Composite: Renders a purple line between points (402, 108) and (269, 226) then Draws a purple rectangle at (260, 106) with width 34 and height 106.
; PLAN: r0=402(x1), r1=108(y1), r2=269(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=106(y), r7=34(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 108
LDI r2, 269
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 106
LDI r7, 34
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
