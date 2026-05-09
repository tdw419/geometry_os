; DESCRIPTION: Composite: Renders a blue box of size 13x69 starting at (463, 175) then Places a blue circle of radius 31 at center (137, 52).
; PLAN: r0=463(x), r1=175(y), r2=13(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=52(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 463
LDI r1, 175
LDI r2, 13
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 52
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
