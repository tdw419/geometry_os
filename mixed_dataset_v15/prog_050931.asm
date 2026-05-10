; DESCRIPTION: Composite: Places a purple line segment connecting (136, 50) to (469, 208) then Draws a green rectangle at (408, 0) with width 99 and height 13.
; PLAN: r0=136(x1), r1=50(y1), r2=469(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=0(y), r7=99(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 50
LDI r2, 469
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 0
LDI r7, 99
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
