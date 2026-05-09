; DESCRIPTION: Composite: Renders a purple box of size 10x69 starting at (442, 85) then Draws a orange circle centered at (424, 175) with radius 69.
; PLAN: r0=442(x), r1=85(y), r2=10(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=175(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 442
LDI r1, 85
LDI r2, 10
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 175
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
