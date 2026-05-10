; DESCRIPTION: Composite: Renders a red box of size 104x41 starting at (396, 1) then Sets a single white pixel at (145, 194) then Draws a yellow circle centered at (161, 60) with radius 41.
; PLAN: r0=396(x), r1=1(y), r2=104(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=60(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 1
LDI r2, 104
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 60
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
