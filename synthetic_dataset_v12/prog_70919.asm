; DESCRIPTION: Composite: Renders a red disk with center (122, 220) and radius 34 then Renders a red box of size 10x88 starting at (150, 76) then Places a orange line segment connecting (357, 37) to (94, 15).
; PLAN: r0=122(x), r1=220(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=76(y), r7=10(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=357(x1), r11=37(y1), r12=94(x2), r13=15(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 220
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 76
LDI r7, 10
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 37
LDI r12, 94
LDI r13, 15
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
