; DESCRIPTION: Composite: Draws a red line from (419, 107) to (486, 73) then Draws a orange circle centered at (84, 159) with radius 52 then Renders a orange box of size 20x45 starting at (287, 105).
; PLAN: r0=419(x1), r1=107(y1), r2=486(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=159(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x), r11=105(y), r12=20(width), r13=45(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 107
LDI r2, 486
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 159
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 105
LDI r12, 20
LDI r13, 45
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
