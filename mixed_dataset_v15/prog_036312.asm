; DESCRIPTION: Composite: Draws a green line from (43, 101) to (397, 169) then Creates a red rectangular region at (390, 28) spanning 59 by 59 pixels.
; PLAN: r0=43(x1), r1=101(y1), r2=397(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=28(y), r7=59(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 101
LDI r2, 397
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 28
LDI r7, 59
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
