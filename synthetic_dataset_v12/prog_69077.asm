; DESCRIPTION: Composite: Renders a blue line between points (366, 84) and (182, 23) then Creates a black rectangular region at (242, 119) spanning 26 by 116 pixels.
; PLAN: r0=366(x1), r1=84(y1), r2=182(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=119(y), r7=26(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 84
LDI r2, 182
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 119
LDI r7, 26
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
