; DESCRIPTION: Composite: Places a green 49x53 rectangle at position (99, 91) then Creates a purple circular shape at (44, 162) with radius 36 then Places a blue dot at position (355, 76).
; PLAN: r0=99(x), r1=91(y), r2=49(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=162(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=76(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 91
LDI r2, 49
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 162
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 76
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
