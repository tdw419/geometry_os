; DESCRIPTION: Composite: Renders a blue box of size 13x101 starting at (265, 38) then Sets a single green pixel at (375, 28) then Places a black circle of radius 29 at center (428, 50).
; PLAN: r0=265(x), r1=38(y), r2=13(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=50(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 38
LDI r2, 13
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 428
LDI r11, 50
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
