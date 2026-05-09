; DESCRIPTION: Composite: Places a magenta 13x70 rectangle at position (22, 46) then Places a blue dot at position (110, 170) then Draws a black circle centered at (403, 96) with radius 23.
; PLAN: r0=22(x), r1=46(y), r2=13(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=170(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=403(x), r11=96(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 22
LDI r1, 46
LDI r2, 13
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 170
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 403
LDI r11, 96
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
