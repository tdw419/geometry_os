; DESCRIPTION: Composite: Draws a blue rectangle at (154, 7) with width 118 and height 24 then Places a yellow line segment connecting (451, 195) to (179, 16).
; PLAN: r0=154(x), r1=7(y), r2=118(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x1), r6=195(y1), r7=179(x2), r8=16(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 7
LDI r2, 118
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 195
LDI r7, 179
LDI r8, 16
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
