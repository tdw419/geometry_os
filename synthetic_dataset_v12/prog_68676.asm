; DESCRIPTION: Composite: Renders a blue box of size 83x63 starting at (110, 53) then Draws a orange circle centered at (234, 84) with radius 70.
; PLAN: r0=110(x), r1=53(y), r2=83(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=84(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 53
LDI r2, 83
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 84
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
