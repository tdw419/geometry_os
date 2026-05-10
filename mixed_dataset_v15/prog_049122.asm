; DESCRIPTION: Composite: Places a green line segment connecting (196, 76) to (490, 38) then Creates a black rectangular region at (304, 145) spanning 41 by 93 pixels.
; PLAN: r0=196(x1), r1=76(y1), r2=490(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=145(y), r7=41(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 76
LDI r2, 490
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 145
LDI r7, 41
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
