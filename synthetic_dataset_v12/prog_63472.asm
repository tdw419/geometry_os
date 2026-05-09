; DESCRIPTION: Composite: Places a orange line segment connecting (386, 29) to (149, 155) then Places a orange 96x96 rectangle at position (371, 62).
; PLAN: r0=386(x1), r1=29(y1), r2=149(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=62(y), r7=96(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 29
LDI r2, 149
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 62
LDI r7, 96
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
