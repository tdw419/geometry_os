; DESCRIPTION: Composite: Creates a red rectangular region at (172, 121) spanning 47 by 49 pixels then Places a black line segment connecting (320, 68) to (25, 229).
; PLAN: r0=172(x), r1=121(y), r2=47(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x1), r6=68(y1), r7=25(x2), r8=229(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 121
LDI r2, 47
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 68
LDI r7, 25
LDI r8, 229
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
