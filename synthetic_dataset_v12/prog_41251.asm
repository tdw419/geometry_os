; DESCRIPTION: Composite: Draws a orange rectangle at (322, 104) with width 106 and height 62 then Places a purple line segment connecting (70, 12) to (6, 105) then Places a white dot at position (458, 223).
; PLAN: r0=322(x), r1=104(y), r2=106(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x1), r6=12(y1), r7=6(x2), r8=105(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=223(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 104
LDI r2, 106
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 12
LDI r7, 6
LDI r8, 105
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 223
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
