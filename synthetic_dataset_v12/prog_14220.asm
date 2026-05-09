; DESCRIPTION: Composite: Sets a single yellow pixel at (309, 3) then Places a green line segment connecting (124, 97) to (233, 41) then Draws a orange rectangle at (464, 156) with width 32 and height 89.
; PLAN: r0=309(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=124(x1), r6=97(y1), r7=233(x2), r8=41(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=464(x), r11=156(y), r12=32(width), r13=89(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 3
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 124
LDI r6, 97
LDI r7, 233
LDI r8, 41
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 156
LDI r12, 32
LDI r13, 89
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
