; DESCRIPTION: Composite: Draws a yellow rectangle at (349, 2) with width 89 and height 60 then Renders a cyan disk with center (125, 166) and radius 56 then Places a black line segment connecting (334, 207) to (156, 230).
; PLAN: r0=349(x), r1=2(y), r2=89(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=166(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x1), r11=207(y1), r12=156(x2), r13=230(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 2
LDI r2, 89
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 166
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 207
LDI r12, 156
LDI r13, 230
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
