; DESCRIPTION: Composite: Places a yellow line segment connecting (283, 51) to (25, 17) then Creates a red rectangular region at (62, 40) spanning 53 by 99 pixels.
; PLAN: r0=283(x1), r1=51(y1), r2=25(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=40(y), r7=53(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 51
LDI r2, 25
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 40
LDI r7, 53
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
