; DESCRIPTION: Composite: Renders a red disk with center (134, 74) and radius 22 then Draws a orange line from (88, 13) to (26, 101) then Renders a red box of size 89x10 starting at (27, 126).
; PLAN: r0=134(x), r1=74(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x1), r6=13(y1), r7=26(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=126(y), r12=89(width), r13=10(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 74
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 13
LDI r7, 26
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 126
LDI r12, 89
LDI r13, 10
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
