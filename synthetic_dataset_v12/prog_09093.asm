; DESCRIPTION: Composite: Renders a green box of size 80x80 starting at (15, 141) then Places a orange line segment connecting (77, 15) to (45, 30).
; PLAN: r0=15(x), r1=141(y), r2=80(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=15(y1), r7=45(x2), r8=30(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 141
LDI r2, 80
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 15
LDI r7, 45
LDI r8, 30
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
