; DESCRIPTION: Composite: Places a red line segment connecting (301, 112) to (129, 110) then Creates a orange rectangular region at (21, 173) spanning 49 by 10 pixels.
; PLAN: r0=301(x1), r1=112(y1), r2=129(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=173(y), r7=49(width), r8=10(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 112
LDI r2, 129
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 173
LDI r7, 49
LDI r8, 10
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
