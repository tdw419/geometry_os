; DESCRIPTION: Composite: Draws a black circle centered at (307, 185) with radius 11 then Renders a blue line between points (252, 244) and (415, 181) then Places a white dot at position (118, 41).
; PLAN: r0=307(x), r1=185(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x1), r6=244(y1), r7=415(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=118(x), r11=41(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 185
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 244
LDI r7, 415
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 41
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
