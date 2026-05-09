; DESCRIPTION: Composite: Renders a black disk with center (384, 145) and radius 70 then Renders a blue box of size 77x102 starting at (396, 95) then Places a green line segment connecting (65, 163) to (447, 141).
; PLAN: r0=384(x), r1=145(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=95(y), r7=77(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x1), r11=163(y1), r12=447(x2), r13=141(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 145
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 95
LDI r7, 77
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 163
LDI r12, 447
LDI r13, 141
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
