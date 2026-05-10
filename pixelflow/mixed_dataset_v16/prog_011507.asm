; DESCRIPTION: Composite: Places a cyan line segment connecting (254, 244) to (225, 133) then Creates a blue rectangular region at (101, 109) spanning 38 by 106 pixels.
; PLAN: r0=254(x1), r1=244(y1), r2=225(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=109(y), r7=38(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 244
LDI r2, 225
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 109
LDI r7, 38
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
