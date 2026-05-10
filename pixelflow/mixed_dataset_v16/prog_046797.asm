; DESCRIPTION: Composite: Draws a green rectangle at (72, 117) with width 52 and height 68 then Draws a purple circle centered at (275, 166) with radius 71 then Places a cyan line segment connecting (369, 91) to (312, 55).
; PLAN: r0=72(x), r1=117(y), r2=52(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=166(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x1), r11=91(y1), r12=312(x2), r13=55(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 117
LDI r2, 52
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 166
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 91
LDI r12, 312
LDI r13, 55
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
