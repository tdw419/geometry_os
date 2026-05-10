; DESCRIPTION: Composite: Renders a yellow box of size 91x95 starting at (98, 54) then Places a white circle of radius 76 at center (349, 98) then Draws a black line from (324, 118) to (154, 22).
; PLAN: r0=98(x), r1=54(y), r2=91(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=98(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x1), r11=118(y1), r12=154(x2), r13=22(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 54
LDI r2, 91
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 98
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 118
LDI r12, 154
LDI r13, 22
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
