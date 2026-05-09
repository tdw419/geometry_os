; DESCRIPTION: Composite: Renders a green box of size 96x18 starting at (302, 0) then Places a orange line segment connecting (294, 254) to (444, 182) then Places a red circle of radius 71 at center (272, 159).
; PLAN: r0=302(x), r1=0(y), r2=96(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=254(y1), r7=444(x2), r8=182(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=159(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 0
LDI r2, 96
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 254
LDI r7, 444
LDI r8, 182
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 159
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
