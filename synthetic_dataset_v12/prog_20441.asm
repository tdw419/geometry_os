; DESCRIPTION: Composite: Draws a orange rectangle at (409, 83) with width 97 and height 13 then Places a purple dot at position (276, 5) then Renders a black line between points (366, 66) and (100, 188).
; PLAN: r0=409(x), r1=83(y), r2=97(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=5(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=66(y1), r12=100(x2), r13=188(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 83
LDI r2, 97
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 5
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 66
LDI r12, 100
LDI r13, 188
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
