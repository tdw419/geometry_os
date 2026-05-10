; DESCRIPTION: Composite: Places a black line segment connecting (49, 88) to (261, 40) then Draws a magenta rectangle at (86, 60) with width 47 and height 41 then Places a white dot at position (75, 78).
; PLAN: r0=49(x1), r1=88(y1), r2=261(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=60(y), r7=47(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=78(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 88
LDI r2, 261
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 60
LDI r7, 47
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 78
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
