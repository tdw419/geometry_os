; DESCRIPTION: Composite: Places a red line segment connecting (321, 105) to (91, 49) then Renders a yellow box of size 43x65 starting at (85, 101) then Places a cyan circle of radius 42 at center (342, 69).
; PLAN: r0=321(x1), r1=105(y1), r2=91(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=101(y), r7=43(width), r8=65(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=69(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 105
LDI r2, 91
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 101
LDI r7, 43
LDI r8, 65
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 69
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
