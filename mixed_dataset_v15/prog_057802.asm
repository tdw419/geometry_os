; DESCRIPTION: Composite: Renders a white box of size 17x83 starting at (93, 32) then Places a yellow dot at position (470, 232) then Places a purple line segment connecting (360, 40) to (494, 15).
; PLAN: r0=93(x), r1=32(y), r2=17(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=232(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=360(x1), r11=40(y1), r12=494(x2), r13=15(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 32
LDI r2, 17
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 232
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 360
LDI r11, 40
LDI r12, 494
LDI r13, 15
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
