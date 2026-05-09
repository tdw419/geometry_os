; DESCRIPTION: Composite: Draws a cyan rectangle at (232, 81) with width 87 and height 31 then Sets a single magenta pixel at (201, 20) then Draws a purple circle centered at (435, 160) with radius 40.
; PLAN: r0=232(x), r1=81(y), r2=87(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=20(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=160(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 232
LDI r1, 81
LDI r2, 87
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 20
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 435
LDI r11, 160
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
