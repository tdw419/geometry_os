; DESCRIPTION: Composite: Places a yellow line segment connecting (507, 86) to (156, 108) then Creates a black rectangular region at (241, 55) spanning 57 by 84 pixels.
; PLAN: r0=507(x1), r1=86(y1), r2=156(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=55(y), r7=57(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 507
LDI r1, 86
LDI r2, 156
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 55
LDI r7, 57
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
