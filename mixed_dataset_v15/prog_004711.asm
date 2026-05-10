; DESCRIPTION: Composite: Creates a blue circular shape at (324, 142) with radius 68 then Places a orange line segment connecting (481, 225) to (482, 118) then Renders a black box of size 26x41 starting at (317, 40).
; PLAN: r0=324(x), r1=142(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=225(y1), r7=482(x2), r8=118(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=40(y), r12=26(width), r13=41(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 142
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 225
LDI r7, 482
LDI r8, 118
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 40
LDI r12, 26
LDI r13, 41
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
