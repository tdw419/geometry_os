; DESCRIPTION: Composite: Places a blue dot at position (508, 53) then Places a yellow 68x101 rectangle at position (202, 38) then Creates a orange circular shape at (109, 170) with radius 63.
; PLAN: r0=508(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=38(y), r7=68(width), r8=101(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=109(x), r11=170(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 38
LDI r7, 68
LDI r8, 101
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 170
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
