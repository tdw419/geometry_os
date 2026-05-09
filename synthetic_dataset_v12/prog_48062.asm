; DESCRIPTION: Composite: Renders a orange box of size 34x93 starting at (23, 126) then Places a orange line segment connecting (432, 110) to (129, 212).
; PLAN: r0=23(x), r1=126(y), r2=34(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=110(y1), r7=129(x2), r8=212(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 126
LDI r2, 34
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 110
LDI r7, 129
LDI r8, 212
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
