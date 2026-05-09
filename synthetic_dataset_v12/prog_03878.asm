; DESCRIPTION: Composite: Places a black circle of radius 31 at center (398, 43) then Sets a single purple pixel at (155, 120) then Draws a yellow rectangle at (63, 16) with width 28 and height 115.
; PLAN: r0=398(x), r1=43(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=120(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=16(y), r12=28(width), r13=115(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 43
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 120
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 63
LDI r11, 16
LDI r12, 28
LDI r13, 115
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
