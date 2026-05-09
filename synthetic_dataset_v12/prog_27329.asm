; DESCRIPTION: Composite: Creates a orange rectangular region at (154, 123) spanning 49 by 110 pixels then Renders a green line between points (467, 101) and (198, 164).
; PLAN: r0=154(x), r1=123(y), r2=49(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=101(y1), r7=198(x2), r8=164(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 123
LDI r2, 49
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 101
LDI r7, 198
LDI r8, 164
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
