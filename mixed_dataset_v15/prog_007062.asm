; DESCRIPTION: Composite: Renders a orange disk with center (183, 145) and radius 65 then Places a white line segment connecting (221, 94) to (258, 163) then Draws a magenta rectangle at (426, 163) with width 47 and height 13.
; PLAN: r0=183(x), r1=145(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=94(y1), r7=258(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=163(y), r12=47(width), r13=13(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 145
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 94
LDI r7, 258
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 163
LDI r12, 47
LDI r13, 13
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
