; DESCRIPTION: Composite: Renders a blue disk with center (351, 139) and radius 76 then Draws a green rectangle at (26, 81) with width 50 and height 105 then Places a black line segment connecting (106, 173) to (66, 228).
; PLAN: r0=351(x), r1=139(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=81(y), r7=50(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x1), r11=173(y1), r12=66(x2), r13=228(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 139
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 81
LDI r7, 50
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 173
LDI r12, 66
LDI r13, 228
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
