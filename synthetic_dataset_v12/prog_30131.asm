; DESCRIPTION: Composite: Places a purple line segment connecting (132, 176) to (354, 70) then Renders a orange box of size 80x94 starting at (0, 130).
; PLAN: r0=132(x1), r1=176(y1), r2=354(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=130(y), r7=80(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 176
LDI r2, 354
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 130
LDI r7, 80
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
