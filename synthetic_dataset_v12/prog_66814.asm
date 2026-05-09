; DESCRIPTION: Composite: Draws a blue circle centered at (443, 121) with radius 68 then Sets a single blue pixel at (395, 110) then Renders a magenta box of size 81x34 starting at (84, 119).
; PLAN: r0=443(x), r1=121(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=110(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=119(y), r12=81(width), r13=34(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 121
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 110
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 84
LDI r11, 119
LDI r12, 81
LDI r13, 34
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
