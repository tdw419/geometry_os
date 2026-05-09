; DESCRIPTION: Composite: Renders a white box of size 74x91 starting at (26, 163) then Draws a orange line from (482, 83) to (87, 42) then Places a red dot at position (296, 88).
; PLAN: r0=26(x), r1=163(y), r2=74(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=83(y1), r7=87(x2), r8=42(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=88(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 163
LDI r2, 74
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 83
LDI r7, 87
LDI r8, 42
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 88
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
