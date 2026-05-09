; DESCRIPTION: Composite: Creates a orange rectangular region at (76, 99) spanning 70 by 13 pixels then Places a yellow dot at position (315, 169) then Draws a yellow circle centered at (100, 162) with radius 12.
; PLAN: r0=76(x), r1=99(y), r2=70(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=169(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=100(x), r11=162(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 99
LDI r2, 70
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 169
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 100
LDI r11, 162
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
