; DESCRIPTION: Composite: Places a white line segment connecting (423, 200) to (344, 65) then Creates a orange rectangular region at (154, 18) spanning 30 by 58 pixels.
; PLAN: r0=423(x1), r1=200(y1), r2=344(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=18(y), r7=30(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 200
LDI r2, 344
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 18
LDI r7, 30
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
