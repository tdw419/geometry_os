; DESCRIPTION: Composite: Draws a green rectangle at (4, 44) with width 19 and height 101 then Places a purple line segment connecting (434, 208) to (327, 49).
; PLAN: r0=4(x), r1=44(y), r2=19(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x1), r6=208(y1), r7=327(x2), r8=49(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 44
LDI r2, 19
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 208
LDI r7, 327
LDI r8, 49
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
