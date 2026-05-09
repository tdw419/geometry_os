; DESCRIPTION: Composite: Draws a cyan circle centered at (324, 69) with radius 38 then Places a black line segment connecting (463, 95) to (494, 111) then Renders a yellow box of size 20x40 starting at (316, 207).
; PLAN: r0=324(x), r1=69(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=95(y1), r7=494(x2), r8=111(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=207(y), r12=20(width), r13=40(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 69
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 95
LDI r7, 494
LDI r8, 111
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 207
LDI r12, 20
LDI r13, 40
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
