; DESCRIPTION: Composite: Places a blue 28x39 rectangle at position (56, 96) then Sets a single yellow pixel at (40, 7) then Draws a orange circle centered at (469, 139) with radius 34.
; PLAN: r0=56(x), r1=96(y), r2=28(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=7(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=469(x), r11=139(y), r12=34(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 96
LDI r2, 28
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 7
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 469
LDI r11, 139
LDI r12, 34
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
