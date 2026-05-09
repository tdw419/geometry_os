; DESCRIPTION: Composite: Draws a yellow line from (241, 119) to (471, 41) then Places a red circle of radius 53 at center (149, 135) then Draws a purple rectangle at (360, 139) with width 44 and height 88.
; PLAN: r0=241(x1), r1=119(y1), r2=471(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=135(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=139(y), r12=44(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 119
LDI r2, 471
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 135
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 139
LDI r12, 44
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
