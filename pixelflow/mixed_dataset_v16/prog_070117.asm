; DESCRIPTION: Composite: Places a black 111x22 rectangle at position (122, 216) then Places a yellow dot at position (494, 52) then Creates a orange circular shape at (114, 168) with radius 80.
; PLAN: r0=122(x), r1=216(y), r2=111(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=168(y), r12=80(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 216
LDI r2, 111
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 114
LDI r11, 168
LDI r12, 80
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
