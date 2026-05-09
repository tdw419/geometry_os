; DESCRIPTION: Composite: Renders a orange line between points (31, 99) and (432, 101) then Renders a yellow box of size 90x86 starting at (234, 14) then Creates a cyan circular shape at (366, 93) with radius 23.
; PLAN: r0=31(x1), r1=99(y1), r2=432(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=14(y), r7=90(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=366(x), r11=93(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 99
LDI r2, 432
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 14
LDI r7, 90
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 93
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
