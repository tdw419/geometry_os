; DESCRIPTION: Composite: Places a blue 44x26 rectangle at position (122, 222) then Sets a single yellow pixel at (123, 97) then Renders a orange disk with center (471, 70) and radius 29.
; PLAN: r0=122(x), r1=222(y), r2=44(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=97(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=471(x), r11=70(y), r12=29(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 222
LDI r2, 44
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 97
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 471
LDI r11, 70
LDI r12, 29
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
