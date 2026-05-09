; DESCRIPTION: Composite: Draws a green circle centered at (270, 150) with radius 26 then Draws a yellow line from (77, 185) to (45, 228) then Renders a white box of size 13x54 starting at (355, 188).
; PLAN: r0=270(x), r1=150(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x1), r6=185(y1), r7=45(x2), r8=228(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=188(y), r12=13(width), r13=54(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 150
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 185
LDI r7, 45
LDI r8, 228
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 188
LDI r12, 13
LDI r13, 54
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
