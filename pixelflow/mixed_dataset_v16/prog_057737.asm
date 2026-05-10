; DESCRIPTION: Composite: Places a yellow circle of radius 52 at center (302, 181) then Renders a orange line between points (486, 39) and (100, 34) then Renders a red box of size 72x13 starting at (434, 31).
; PLAN: r0=302(x), r1=181(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=39(y1), r7=100(x2), r8=34(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=31(y), r12=72(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 181
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 39
LDI r7, 100
LDI r8, 34
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 31
LDI r12, 72
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
