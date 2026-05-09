; DESCRIPTION: Composite: Draws a white rectangle at (77, 79) with width 85 and height 67 then Draws a yellow line from (413, 106) to (159, 132) then Renders a yellow disk with center (239, 101) and radius 79.
; PLAN: r0=77(x), r1=79(y), r2=85(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x1), r6=106(y1), r7=159(x2), r8=132(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=101(y), r12=79(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 79
LDI r2, 85
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 106
LDI r7, 159
LDI r8, 132
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 101
LDI r12, 79
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
