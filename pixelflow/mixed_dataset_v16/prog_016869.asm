; DESCRIPTION: Composite: Renders a orange disk with center (149, 137) and radius 45 then Draws a purple rectangle at (69, 10) with width 70 and height 32.
; PLAN: r0=149(x), r1=137(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=10(y), r7=70(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 137
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 10
LDI r7, 70
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
