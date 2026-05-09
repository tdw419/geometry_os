; DESCRIPTION: Composite: Draws a blue circle centered at (78, 85) with radius 76 then Draws a white line from (14, 18) to (234, 102) then Renders a black box of size 74x71 starting at (240, 93).
; PLAN: r0=78(x), r1=85(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=18(y1), r7=234(x2), r8=102(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=240(x), r11=93(y), r12=74(width), r13=71(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 85
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 18
LDI r7, 234
LDI r8, 102
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 93
LDI r12, 74
LDI r13, 71
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
