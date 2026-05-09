; DESCRIPTION: Composite: Places a red 23x45 rectangle at position (227, 84) then Places a orange line segment connecting (439, 145) to (153, 72).
; PLAN: r0=227(x), r1=84(y), r2=23(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=145(y1), r7=153(x2), r8=72(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 84
LDI r2, 23
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 145
LDI r7, 153
LDI r8, 72
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
