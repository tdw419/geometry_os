; DESCRIPTION: Composite: Places a orange line segment connecting (372, 8) to (367, 155) then Renders a blue box of size 12x94 starting at (253, 26).
; PLAN: r0=372(x1), r1=8(y1), r2=367(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=26(y), r7=12(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 8
LDI r2, 367
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 26
LDI r7, 12
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
