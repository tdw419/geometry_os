; DESCRIPTION: Composite: Places a cyan line segment connecting (76, 12) to (306, 233) then Creates a yellow rectangular region at (268, 207) spanning 102 by 20 pixels then Renders a orange disk with center (157, 99) and radius 60.
; PLAN: r0=76(x1), r1=12(y1), r2=306(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=207(y), r7=102(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=99(y), r12=60(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 76
LDI r1, 12
LDI r2, 306
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 207
LDI r7, 102
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 99
LDI r12, 60
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
