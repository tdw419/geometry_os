; DESCRIPTION: Composite: Places a purple line segment connecting (221, 11) to (170, 94) then Draws a green rectangle at (68, 160) with width 10 and height 39.
; PLAN: r0=221(x1), r1=11(y1), r2=170(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=160(y), r7=10(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 11
LDI r2, 170
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 160
LDI r7, 10
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
