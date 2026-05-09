; DESCRIPTION: Composite: Draws a orange rectangle at (419, 111) with width 66 and height 95 then Places a orange line segment connecting (94, 116) to (219, 233) then Places a blue circle of radius 76 at center (149, 82).
; PLAN: r0=419(x), r1=111(y), r2=66(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x1), r6=116(y1), r7=219(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=82(y), r12=76(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 111
LDI r2, 66
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 116
LDI r7, 219
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 82
LDI r12, 76
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
