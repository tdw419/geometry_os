; DESCRIPTION: Composite: Draws a yellow rectangle at (417, 76) with width 20 and height 98 then Draws a magenta line from (447, 106) to (15, 8).
; PLAN: r0=417(x), r1=76(y), r2=20(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x1), r6=106(y1), r7=15(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 76
LDI r2, 20
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 106
LDI r7, 15
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
