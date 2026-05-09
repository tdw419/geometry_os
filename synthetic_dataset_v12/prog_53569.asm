; DESCRIPTION: Composite: Places a black 80x69 rectangle at position (93, 48) then Places a black line segment connecting (494, 242) to (307, 191) then Draws a yellow circle centered at (219, 66) with radius 63.
; PLAN: r0=93(x), r1=48(y), r2=80(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x1), r6=242(y1), r7=307(x2), r8=191(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=66(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 48
LDI r2, 80
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 242
LDI r7, 307
LDI r8, 191
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 66
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
