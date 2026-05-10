; DESCRIPTION: Composite: Places a orange line segment connecting (122, 170) to (306, 206) then Places a blue 30x10 rectangle at position (86, 107) then Creates a cyan circular shape at (451, 125) with radius 25.
; PLAN: r0=122(x1), r1=170(y1), r2=306(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=107(y), r7=30(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=125(y), r12=25(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 170
LDI r2, 306
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 107
LDI r7, 30
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 125
LDI r12, 25
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
