; DESCRIPTION: Composite: Places a purple circle of radius 49 at center (220, 110) then Renders a black box of size 97x20 starting at (215, 135) then Sets a single blue pixel at (302, 216).
; PLAN: r0=220(x), r1=110(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=135(y), r7=97(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=216(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 110
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 135
LDI r7, 97
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 216
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
