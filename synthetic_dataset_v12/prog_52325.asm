; DESCRIPTION: Composite: Creates a black rectangular region at (174, 99) spanning 101 by 99 pixels then Renders a yellow line between points (255, 200) and (374, 49).
; PLAN: r0=174(x), r1=99(y), r2=101(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=200(y1), r7=374(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 99
LDI r2, 101
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 200
LDI r7, 374
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
