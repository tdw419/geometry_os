; DESCRIPTION: Composite: Draws a red rectangle at (78, 141) with width 25 and height 72 then Places a orange line segment connecting (118, 104) to (231, 76) then Sets a single cyan pixel at (67, 8).
; PLAN: r0=78(x), r1=141(y), r2=25(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=104(y1), r7=231(x2), r8=76(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=8(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 141
LDI r2, 25
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 104
LDI r7, 231
LDI r8, 76
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 8
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
