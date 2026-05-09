; DESCRIPTION: Composite: Creates a cyan rectangular region at (41, 16) spanning 110 by 99 pixels then Places a blue line segment connecting (437, 162) to (62, 241).
; PLAN: r0=41(x), r1=16(y), r2=110(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=162(y1), r7=62(x2), r8=241(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 16
LDI r2, 110
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 162
LDI r7, 62
LDI r8, 241
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
