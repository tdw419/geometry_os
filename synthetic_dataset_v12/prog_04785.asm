; DESCRIPTION: Composite: Draws a magenta rectangle at (4, 216) with width 76 and height 36 then Draws a cyan line from (374, 87) to (78, 158).
; PLAN: r0=4(x), r1=216(y), r2=76(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x1), r6=87(y1), r7=78(x2), r8=158(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 216
LDI r2, 76
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 87
LDI r7, 78
LDI r8, 158
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
