; DESCRIPTION: Composite: Places a blue dot at position (182, 0) then Places a orange line segment connecting (375, 71) to (383, 159) then Draws a purple circle centered at (120, 141) with radius 34.
; PLAN: r0=182(x), r1=0(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=71(y1), r7=383(x2), r8=159(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=120(x), r11=141(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 0
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 71
LDI r7, 383
LDI r8, 159
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 141
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
