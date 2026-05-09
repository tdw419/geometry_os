; DESCRIPTION: Composite: Places a black line segment connecting (443, 252) to (199, 223) then Creates a cyan rectangular region at (202, 80) spanning 62 by 22 pixels.
; PLAN: r0=443(x1), r1=252(y1), r2=199(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=80(y), r7=62(width), r8=22(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 252
LDI r2, 199
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 80
LDI r7, 62
LDI r8, 22
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
