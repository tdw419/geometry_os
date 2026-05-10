; DESCRIPTION: Composite: Places a orange line segment connecting (80, 167) to (312, 37) then Renders a yellow box of size 120x95 starting at (56, 9).
; PLAN: r0=80(x1), r1=167(y1), r2=312(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=9(y), r7=120(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 167
LDI r2, 312
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 9
LDI r7, 120
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
