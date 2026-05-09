; DESCRIPTION: Composite: Draws a yellow rectangle at (53, 4) with width 76 and height 72 then Draws a orange line from (95, 145) to (62, 101) then Places a white dot at position (135, 141).
; PLAN: r0=53(x), r1=4(y), r2=76(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=145(y1), r7=62(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=135(x), r11=141(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 4
LDI r2, 76
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 145
LDI r7, 62
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 141
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
