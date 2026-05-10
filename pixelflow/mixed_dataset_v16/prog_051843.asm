; DESCRIPTION: Composite: Sets a single yellow pixel at (158, 53) then Renders a yellow box of size 65x117 starting at (274, 25) then Creates a orange circular shape at (123, 69) with radius 66.
; PLAN: r0=158(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=25(y), r7=65(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=69(y), r12=66(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 53
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 25
LDI r7, 65
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 69
LDI r12, 66
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
