; DESCRIPTION: Composite: Renders a magenta disk with center (324, 125) and radius 59 then Draws a black line from (507, 176) to (500, 147) then Draws a magenta rectangle at (439, 111) with width 66 and height 100.
; PLAN: r0=324(x), r1=125(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=176(y1), r7=500(x2), r8=147(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=439(x), r11=111(y), r12=66(width), r13=100(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 125
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 176
LDI r7, 500
LDI r8, 147
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 111
LDI r12, 66
LDI r13, 100
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
