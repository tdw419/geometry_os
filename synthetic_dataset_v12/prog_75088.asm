; DESCRIPTION: Composite: Draws a magenta rectangle at (17, 106) with width 94 and height 98 then Places a orange circle of radius 23 at center (404, 40) then Renders a purple line between points (133, 120) and (469, 68).
; PLAN: r0=17(x), r1=106(y), r2=94(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=40(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x1), r11=120(y1), r12=469(x2), r13=68(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 106
LDI r2, 94
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 40
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 120
LDI r12, 469
LDI r13, 68
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
