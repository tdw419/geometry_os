; DESCRIPTION: Composite: Places a blue line segment connecting (25, 137) to (9, 36) then Renders a purple box of size 54x101 starting at (296, 62).
; PLAN: r0=25(x1), r1=137(y1), r2=9(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=62(y), r7=54(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 137
LDI r2, 9
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 62
LDI r7, 54
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
