; DESCRIPTION: Composite: Renders a blue disk with center (138, 74) and radius 50 then Places a green line segment connecting (267, 54) to (315, 255) then Draws a purple rectangle at (208, 105) with width 36 and height 47.
; PLAN: r0=138(x), r1=74(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x1), r6=54(y1), r7=315(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=105(y), r12=36(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 74
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 54
LDI r7, 315
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 105
LDI r12, 36
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
