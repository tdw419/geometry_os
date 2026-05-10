; DESCRIPTION: Composite: Renders a purple box of size 89x18 starting at (10, 109) then Draws a purple line from (366, 111) to (4, 1) then Renders a red disk with center (169, 100) and radius 80.
; PLAN: r0=10(x), r1=109(y), r2=89(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x1), r6=111(y1), r7=4(x2), r8=1(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=100(y), r12=80(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 109
LDI r2, 89
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 111
LDI r7, 4
LDI r8, 1
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 100
LDI r12, 80
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
