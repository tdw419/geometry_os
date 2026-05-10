; DESCRIPTION: Composite: Renders a orange line between points (305, 138) and (397, 156) then Creates a white rectangular region at (339, 25) spanning 95 by 78 pixels.
; PLAN: r0=305(x1), r1=138(y1), r2=397(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=25(y), r7=95(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 138
LDI r2, 397
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 25
LDI r7, 95
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
