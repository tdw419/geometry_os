; DESCRIPTION: Composite: Renders a blue box of size 36x101 starting at (15, 90) then Sets a single green pixel at (402, 175) then Places a yellow circle of radius 50 at center (417, 124).
; PLAN: r0=15(x), r1=90(y), r2=36(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=175(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=124(y), r12=50(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 90
LDI r2, 36
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 175
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 417
LDI r11, 124
LDI r12, 50
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
