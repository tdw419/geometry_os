; DESCRIPTION: Composite: Renders a yellow box of size 50x56 starting at (93, 144) then Places a orange line segment connecting (407, 100) to (118, 184).
; PLAN: r0=93(x), r1=144(y), r2=50(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=100(y1), r7=118(x2), r8=184(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 144
LDI r2, 50
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 100
LDI r7, 118
LDI r8, 184
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
