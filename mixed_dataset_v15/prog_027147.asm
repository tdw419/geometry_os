; DESCRIPTION: Composite: Creates a orange rectangular region at (12, 93) spanning 62 by 57 pixels then Places a orange line segment connecting (400, 99) to (415, 110).
; PLAN: r0=12(x), r1=93(y), r2=62(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=99(y1), r7=415(x2), r8=110(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 93
LDI r2, 62
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 99
LDI r7, 415
LDI r8, 110
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
